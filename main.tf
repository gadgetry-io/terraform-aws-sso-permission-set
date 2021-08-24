#######################################
# SSO PERMISSION SET
#######################################
resource "aws_ssoadmin_permission_set" "main" {
  name             = var.name
  description      = var.description
  instance_arn     = var.instance_arn
  relay_state      = var.relay_state
  session_duration = var.session_duration
  tags             = var.tags
}

#######################################
# SSO MANAGED POLICY ATTACHMENT
#######################################
resource "aws_ssoadmin_managed_policy_attachment" "main" {
  for_each = toset(var.managed_policy_arns)

  instance_arn       = aws_ssoadmin_permission_set.main.instance_arn
  managed_policy_arn = each.value
  permission_set_arn = aws_ssoadmin_permission_set.main.arn

  depends_on = ["aws_ssoadmin_permission_set.main]
}

#######################################
# SSO PERMISSION SET INLINE POLICY
#######################################
data "aws_iam_policy_document" "main" {
  source_policy_documents = var.inline_policy_jsons
}

resource "aws_ssoadmin_permission_set_inline_policy" "main" {
  count = length(var.inline_policy_jsons) > 0 ? 1 : 0

  inline_policy      = data.aws_iam_policy_document.main.json
  instance_arn       = aws_ssoadmin_permission_set.main.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.main.arn

  depends_on = ["aws_ssoadmin_permission_set.main]
}

#######################################
# OUTPUTS
#######################################

output "name" {
  description = "The Name of the SSO Permission Set"
  value       = aws_ssoadmin_permission_set.name
}

output "arn" {
  description = "The ARN of the SSO Permission Set"
  value       = aws_ssoadmin_permission_set.arn
}

output "session_duration" {
  description = "The Session Duration of the SSO Permission Set"
  value       = aws_ssoadmin_permission_set.session_duration
}
