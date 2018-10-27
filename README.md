# MNDR-OpenStack

------------------------------------------------------------------------------------
Deploying Heat Orchestration Template (HOT) on Openstack 
------------------------------------------------------------------------------------
1. Prepare the heat template, there are some re-usable template from git repo that can be reused base on your use case.

2. Copy the template to staging machine (Undercloud), use vi/vim editor.
   
   [stack@undercloud ~]$ vi mndr_nfvi_poc_auto_scaling.yaml

3. source the RC file that correspond to the project/tenant, 
   
   [stack@undercloud ~]$ source sandvinerc
   
   This is the sample content of the RC file
   [stack@undercloud ~]$ cat sandvinerc
   # Clear any old environment that may conflict.
   for key in $( set | awk '{FS="="}  /^OS_/ {print $1}' ); do unset $key ; done
   export OS_USERNAME=sv
   export OS_TENANT_NAME=Sandvine
   export NOVA_VERSION=1.1
   export OS_PROJECT_NAME=Sandvine
   export OS_PASSWORD=sandvine
   export OS_NO_CACHE=True
   export COMPUTE_API_VERSION=1.1
   export no_proxy=,10.230.4.154,10.230.0.56
   export OS_CLOUDNAME=Unico-overcloud01
   export OS_AUTH_URL=http://10.230.4.154:5000/v2.0
   export PYTHONWARNINGS="ignore:Certificate has no, ignore:A true SSLContext object is not available"

4. Deploy the template with the command below.

   [stack@undercloud sandvine]$ openstack stack create -t mndr_nfvi_poc_auto_scaling.yaml mndr
+---------------------+--------------------------------------+
| Field               | Value                                |
+---------------------+--------------------------------------+
| id                  | ce2aea98-7eeb-449d-9abe-b200cf031656 |
| stack_name          | wp                                   |
| description         | AutoScaling                          |
| creation_time       | 2018-10-24T05:25:26Z                 |
| updated_time        | None                                 |
| stack_status        | CREATE_IN_PROGRESS                   |
| stack_status_reason | Stack CREATE started                 |
+---------------------+--------------------------------------+

5. Verify the template has been successfully deployed

[stack@undercloud sandvine]$ openstack stack list
+--------------------------------------+------------+-----------------+----------------------+--------------+
| ID                                   | Stack Name | Stack Status    | Creation Time        | Updated Time |
+--------------------------------------+------------+-----------------+----------------------+--------------+
| ce2aea98-7eeb-449d-9abe-b200cf031656 | mndr       | CREATE_COMPLETE | 2018-10-24T05:25:26Z | None         |
+--------------------------------------+------------+-----------------+----------------------+--------------+

