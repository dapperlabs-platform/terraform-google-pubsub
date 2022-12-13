# terraform-google-pubsub
Google Pub/Sub topic, including multiple subscriptions and IAM bindings at the topic and subscriptions levels, as well as schemas.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.40.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >= 4.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 4.40.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_pubsub_schema.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_schema) | resource |
| [google_pubsub_subscription.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription) | resource |
| [google_pubsub_subscription_iam_binding.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_subscription_iam_binding) | resource |
| [google_pubsub_topic.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic) | resource |
| [google_pubsub_topic_iam_binding.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_topic_iam_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bigquery_subscription_configs"></a> [bigquery\_subscription\_configs](#input\_bigquery\_subscription\_configs) | Configuration parameters for BigQuery subscriptions. | <pre>map(object({<br>    table               = string<br>    use_topic_schema    = bool<br>    write_metadata      = bool<br>    drop_unknown_fields = bool<br>  }))</pre> | `{}` | no |
| <a name="input_dead_letter_configs"></a> [dead\_letter\_configs](#input\_dead\_letter\_configs) | Per-subscription dead letter policy configuration. | <pre>map(object({<br>    topic                 = string<br>    max_delivery_attempts = number<br>  }))</pre> | `{}` | no |
| <a name="input_defaults"></a> [defaults](#input\_defaults) | Subscription defaults for options. | <pre>object({<br>    ack_deadline_seconds       = number<br>    message_retention_duration = string<br>    retain_acked_messages      = bool<br>    expiration_policy_ttl      = string<br>    filter                     = string<br>  })</pre> | <pre>{<br>  "ack_deadline_seconds": null,<br>  "expiration_policy_ttl": null,<br>  "filter": null,<br>  "message_retention_duration": null,<br>  "retain_acked_messages": null<br>}</pre> | no |
| <a name="input_iam"></a> [iam](#input\_iam) | IAM bindings for topic in {ROLE => [MEMBERS]} format. | `map(list(string))` | `{}` | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | KMS customer managed encryption key. | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels. | `map(string)` | `{}` | no |
| <a name="input_message_retention_duration"></a> [message\_retention\_duration](#input\_message\_retention\_duration) | Minimum duration to retain a message after it is published to the topic. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | PubSub topic name. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project used for resources. | `string` | n/a | yes |
| <a name="input_push_configs"></a> [push\_configs](#input\_push\_configs) | Push subscription configurations. | <pre>map(object({<br>    attributes = map(string)<br>    endpoint   = string<br>    oidc_token = object({<br>      audience              = string<br>      service_account_email = string<br>    })<br>  }))</pre> | `{}` | no |
| <a name="input_regions"></a> [regions](#input\_regions) | List of regions used to set persistence policy. | `list(string)` | `[]` | no |
| <a name="input_schema"></a> [schema](#input\_schema) | Topic schema. If set, all messages in this topic should follow this schema. | <pre>object({<br>    definition   = string<br>    msg_encoding = optional(string, "ENCODING_UNSPECIFIED")<br>    schema_type  = string<br>  })</pre> | `null` | no |
| <a name="input_subscription_iam"></a> [subscription\_iam](#input\_subscription\_iam) | IAM bindings for subscriptions in {SUBSCRIPTION => {ROLE => [MEMBERS]}} format. | `map(map(list(string)))` | `{}` | no |
| <a name="input_subscriptions"></a> [subscriptions](#input\_subscriptions) | Topic subscriptions. Also define push configs for push subscriptions. If options is set to null subscription defaults will be used. Labels default to topic labels if set to null. | <pre>map(object({<br>    labels = map(string)<br>    options = object({<br>      ack_deadline_seconds       = number<br>      message_retention_duration = string<br>      retain_acked_messages      = bool<br>      expiration_policy_ttl      = string<br>      filter                     = string<br>    })<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Topic id. |
| <a name="output_schema"></a> [schema](#output\_schema) | Schema resource. |
| <a name="output_schema_id"></a> [schema\_id](#output\_schema\_id) | Schema resource id. |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | Subscription ids. |
| <a name="output_subscriptions"></a> [subscriptions](#output\_subscriptions) | Subscription resources. |
| <a name="output_topic"></a> [topic](#output\_topic) | Topic resource. |
<!-- END_TF_DOCS -->