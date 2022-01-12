package accurics

## id 为策略在策略组中的唯一标识，由大小写英文字符、数字、"."、"_"、"-" 组成
## 建议按`组织_云商_资源名称/分类_编号`的格式进行命名
# @id: cloudiac_alicloud_security_p001

# @name: Web服务开放了非Web端口
# @description: 对于公网入网端口，Web 服务只允许开放 80（http） 和 443（https）端口访问

## 策略类型，如 aws, k8s, github, alicloud, ...
# @policy_type: alicloud

## 资源类型，如 aws_ami, k8s_pod, alicloud_ecs, ...
# @resource_type: alicloud_security_group_rule

## 策略严重级别: 可选 HIGH/MEDIUM/LOW
# @severity: HIGH

## 策略分类(或者叫标签)，多个分类使用逗号分隔
# @label: 安全

## 策略修复建议（支持多行）
# @fix_suggestion: 
# 安全组 security group 配置端口为 80 或者 443
# ```
# resource "alicloud_security_group_rule" "foo" {
#  type              = "ingress"
#  ip_protocol       = "tcp"
#  nic_type          = "intranet"
#  policy            = "accept"
#~ port_range        = "80/80"
#  ...
# }
# ```
# @fix_suggestion_end

nonWebPortExposeToInternet[sg.id] {
    sg := input.alicloud_security_group_rule[_]
    sg.config.ip_protocol = "tcp"
    sg.config.nic_type = "intranet"
    sg.config.policy = "accept"
    sg.config.type = "ingress"
    not sg.config.port_range == "80/80"
    not sg.config.port_range == "443/443"
}
