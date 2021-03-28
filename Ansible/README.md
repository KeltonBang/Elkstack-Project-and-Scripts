## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://drive.google.com/file/d/1CBeaLBcn-aA2GJBpobpPRE0YlcFiQgrr/view?usp=sharing

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

-Load balancing ensures that the application will be highly dependable (available), in addition to restricting inbound traffic to the network.


-Load Balancers protect the availability of the information on the webservers and prevent them from being overloaded with traffic. The Load balancer does this by distributing the traffic  between the webservers.

-The advantage of a jump box is the secure access from one allowed IP address, preventing others from accessing our network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file systems and system metrics.

--Filebeat monitors the log files and locations specifified on our webservers and outputs the data to our kibana gui.

--Metricbeat periodically collect system metrics from the webservers as well as application metrics, takes the metrics and statistics that it collects and ships them to the output that you specify.

The configuration details of each machine may be found below.

| Name     | Function | IP Address (private)| Operating System |
|----------|---------|------------|---------------|
| Jump Box | Gateway |  10.0.0.4   |   Linux       |
| Web-1    |Webserver|  10.0.0.5   |   Linux       |
| Web-2    |Webserver|  10.0.0.6   |   Linux       |
| Web-3    |Webserver|  10.0.0.7   |   Linux       |
|  Elk     |Elk Stack|  10.1.0.4   |   Linux       |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- white listed ip address---67.64.30.98

Machines within the network can only be accessed by Jump Box Provisioner.
- JumpBox private ip: 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box |         Yes         |     67.64.30.98      |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Automating configuration of the elk machine is advantageous due to anyone being able to run your configuration settings and setup their own elk stack quickly. Automation makes it easier to rapidly deploy desired configurations in the future as many times as needed.

The playbook implements the following tasks:

- run all following commands as sudo 
- install docker
- install python3-pip
- install docker python module
- use more memory
- download and launch a docker container, and start it always on restart
The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

-https://docs.google.com/document/d/1Zgxcj8v_aqrTJFOtR3diKj1oLKQPofYygW56s6pl5X8/edit?usp=sharing

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- DVWA-1 = 10.0.0.5
- DVWA-2 = 10.0.0.6
- DVWA-3 = 10.0.0.7

We have installed the following Beats on these machines:
- Metricbeat
- Filebeat

These Beats allow us to collect the following information from each machine:

-filebeat - is used to detect changes to the filesystem on the webservers

-Metricbeat - is used to detect changes in system metrics on the webservers.  This collects cpu/ram statistics, failed remote logins, and failed priviledge escalations.

### Using the Playbook


In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

**ansible-playbook -v playbookname.yml  -use this command to run your playbook files  *note - you need to be in the directory they are located in to run them!!!**

SSH into the control node *ansible container from jump box* and follow the steps below:

- Copy the playbookfiles to the Ansible Control node. This should be placed in /ect/ansible/roles.  Use git clone https://github.com/KeltonBang/FirstElkStack.git to acquire the repository and Infrastructure code

- Update the config.yml, playbook.yml, and hosts files to include...
-   your DVWA private ips, and your elk vm private ips.

---Move your config.yml files to /etc/ansible/files  *use mv command** *note* - you may need to create this directory first using: mkdir /etc/ansible/files

- Run the playbooks.yml using :ansible-playbook *filename*.yml 

- The Ansible-Playbook files are:
- install-metricbeat.yml
- install-filebeat.yml
- install-elk.yml

-  You should copy the ansible playbooks into
    - /etc/ansible/roles    *if you don't have this directory yet, use mkdir /etc/ansible/roles to create it*

              **Use mv command to both copy and move the files**


- Which file do you update to make Ansible run the playbook on a specific machine? 

--- Edit the host name at the top of the playbook to tell ansible to run the playbook from the specified host either under webservers or elkservers in the hosts file


- How do I specify which machine to install the ELK server on versus which to install Filebeat on?_

---In your hosts file you should have webservers private ip listed and a elkserver private ip listed.  Your playbook file will use the hosts file to determine which ip to install on. This is directed by typing webservers or elkserver in the hosts:  location in the playbook.yml. 

After running your playbooks, you can check them by running a command:   curl http://10.1.0.4:5601  ---this should print html to your terminal if everything is correct and running.


-Go to the kibana website to utilize the gui and sort through the data.


Kibana Website

http://<ELK_VM_PUBLIC.IP>:5601/app/kibana
