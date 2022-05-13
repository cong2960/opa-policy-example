package accurics


 eipNotAssociateInstance[instance.id] {
     instance := input.alicloud_instance[_]
     eipassoc := input.alicloud_eip_association[_]
    contains(eipassoc.config.instance_id,instance.id)
 }

#eipNotAssociateInstance[instance.id] {
 #   instance := input.alicloud_instance[_]
   # not input.alicloud_eip_association
#}
