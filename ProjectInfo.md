## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://drive.google.com/file/d/1CBeaLBcn-aA2GJBpobpPRE0YlcFiQgrr/view?usp=sharing

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the __playbook___ file may be used to install only certain pieces of it, such as Filebeat.

  

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly __dependable (available)___, in addition to restricting __inbound traffic___ to the network.
--Load Balancers protect the availability of the information on the webservers and prevent them from being overloaded with traffic. The Load balancer does this by distributing the traffic  between the webservers.The advantage of a jump box is the secure access from one allowed IP address, preventing others from accessing our network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the __file systems___ and system __metrics___.
--Filebeat monitors the log files and locations specifified on our webservers and outputs the data to our kibana gui.
--Metricbeat periodically collect system metrics from the webservers as well as application metrics, takes the metrics and statistics that it collects and ships them to the output that you specify.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address (private)| Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway |  10.0.0.4   |   Linux       |
| Web-1    |Webserver|  10.0.0.5   |  Linux        |
| Web-2    |Webserver|  10.0.0.6   |  Linux        |
| Web-3    |Webserver|  10.0.0.7   |  Linux        |
|Elk       |Elk Stack|  10.1.0.4   |  Linux        |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the __Jump Box___ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _white listed ip addresse_---67.64.30.98

Machines within the network can only be accessed by __Jump Box Provisioner___.
- _10.0.0.4_

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 |     67.64.30.98      |
|          |                     |                      |
|          |                     |                      |

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
- _DVWA-1 = 10.0.0.5
- _DVWA-2 = 10.0.0.6
- _DVWA-3 = 10.0.0.7

We have installed the following Beats on these machines:
- _Metricbeat
- _Filebeat

These Beats allow us to collect the following information from each machine:
-filebeat - filebeat is used to detect changes to the filesystem on the webservers
-Metricbeat - is used to detect changes in system metrics on the webservers.  This collects cpu/ram statistics, failed remote logins, and failed priviledge escalations.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node *ansible container from jump box* and follow the steps below:
- Copy the ___playbook__ file to __the Ansible Control node ___. This should be placed in /ect/ansible/files.  Use git clone *repositoryurl* to acquire the playbooks
- Update the __config.yml, playbook.yml, and ansible hosts___ files to include...
-   your DVWA private ips, and your elk vm private ips.
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? 
- 
- Where do you copy it?_
- 
- Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- 
- _Which URL do you navigate to in order to check that the ELK server is running?
Kibana Website
http://<ELK_VM_PUBLIC.IP>:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
