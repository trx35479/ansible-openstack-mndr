# MNDR-OpenStack

## Build the MNDR image using the packer

1. Go to mndr_builder directory

   ```
   $ cd mndr-openstack
   ```
   
2. Get an archive of bootstrap scripts (the archive scripts will be uploaded into the image for bootstraping the MNDR config and F5 configuration during Heat template deployment)

   ```
   $ tar -cvf mndr_builder/bootstrap.tar app_bootstrap
   ```

2. Execute below to build the image of MNDR

   ```
   $ cd mndr_builder
   
   $ packer build mndr_builder_rhel.json (for Red Hat OS)
   
   $ packer build mndr_builder_fedora.json (for Fedora28 OS)
   ```

Note: Packer will build the Image with the corresponding software and dependecies. 
      Artefacts will be created in Openstack Glance


## Deploying Heat Orchestration Template (HOT) on Openstack
 
1. Prepare the heat template, note the Image built by Packer and edit the template to use the new Image.

2. Go to mndr-openstack/heat_template directory

3. source the RC file that correspond to the project/tenant.

   ```
   [stack@undercloud ~]$ source sandvinerc
   ```

4. Deploy the template with the command below.

   ```
   [stack@undercloud ~]$ mndr-openstack/heat_template]$ openstack stack create -t mndr_heat_scale.yaml -e env.yaml mndr (name of the stack)
   ```
   
   You should see below log after the execution of command. 
   
    ```
      +---------------------+--------------------------------------+
      | Field               | Value                                |
      +---------------------+--------------------------------------+
      | id                  | ce2aea98-7eeb-449d-9abe-b200cf031656 |
      | stack_name          | mndr                                 |
      | description         | AutoScaling                          |
      | creation_time       | 2018-10-24T05:25:26Z                 |
      | updated_time        | None                                 |
      | stack_status        | CREATE_IN_PROGRESS                   |
      | stack_status_reason | Stack CREATE started                 |
      +---------------------+--------------------------------------+
    ```    

5. Verify the template has been successfully deployed

    ```
    [stack@undercloud sandvine]$ openstack stack list
    ```
    
    ```
      +--------------------------------------+------------+-----------------+----------------------+--------------+
      | ID                                   | Stack Name | Stack Status    | Creation Time        | Updated Time |
      +--------------------------------------+------------+-----------------+----------------------+--------------+
      | ce2aea98-7eeb-449d-9abe-b200cf031656 | mndr       | CREATE_COMPLETE | 2018-10-24T05:25:26Z | None         |
      +--------------------------------------+------------+-----------------+----------------------+--------------+
    ```

