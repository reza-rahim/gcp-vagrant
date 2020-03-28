# gcp-vagrant


```bash
# Create nested-vm-image
cloud compute disks create centos7-disk --image-project centos-cloud --image-family centos-7 --zone us-central1-b


gcloud compute images create nested-vm-image-centos  --source-disk centos7-disk --source-disk-zone us-central1-b  --licenses "https://compute.googleapis.com/compute/v1/projects/vm-options/global/licenses/enable-vmx"

gcloud beta compute --project=redislabs-sa-training-services instances create vb-centos --zone=us-central1-a --machine-type=n1-standard-4 --subnet=subnet --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=37346316774-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --image=nested-vm-image-centos --image-project=redislabs-sa-training-services --boot-disk-size=100GB --boot-disk-type=pd-standard --boot-disk-device-name=instance-1 --reservation-affinity=any

gcloud beta compute ssh --zone "us-central1-a" "kvm-centos" --project "redislabs-sa-training-services"
```

```bash
###virtual box
https://wiki.centos.org/HowTos/Virtualization/VirtualBox
## complie kernel module
yum install "kernel-devel-uname-r == $(uname -r)"
/sbin/vboxconfig
 
### vagrant
https://linuxize.com/post/how-to-install-vagrant-on-centos-7/
sudo yum install https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.rpm

```
