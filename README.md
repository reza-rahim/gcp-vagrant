# gcp-vagrant


```bash
# Create nested-vm-image
cloud compute disks create centos7-disk --image-project centos-cloud --image-family centos-7 --zone us-central1-b


gcloud compute images create nested-vm-image-centos  --source-disk centos7-disk --source-disk-zone us-central1-b  --licenses "https://compute.googleapis.com/compute/v1/projects/vm-options/global/licenses/enable-vmx"
```
