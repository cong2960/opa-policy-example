package accurics

## id 为策略在策略组中的唯一标识，由大小写英文字符、数字、"."、"_"、"-" 组成
## 建议按`组织_云商_资源名称/分类_编号`的格式进行命名
# @id: cloudiac_alicloud_cost_p001

# @name: 实例类型超过小型实例限制
# @description: 基于成本原因，限制实例类型只能为 small 或者 nano 类型的小型实例

## 策略类型，如 aws, k8s, github, alicloud, ...
# @policy_type: alicloud

## 资源类型，如 aws_ami, k8s_pod, alicloud_ecs, ...
# @resource_type: alicloud_instance

## 策略严重级别: 可选 HIGH/MEDIUM/LOW
# @severity: HIGH

## 策略分类(或者叫标签)，多个分类使用逗号分隔
# @category: 成本

## 策略修复建议
# @fix_suggestion: instance_type 使用包含 small / nano 的小型实例类型

limitedSmallInstanceType[instance.id] {
	instance := input.alicloud_instance[_]
	not contains(instance.config.instance_type, "nano")
	not contains(instance.config.instance_type, "small")
}
