output "id" {
  description = "Topic id."
  value       = google_pubsub_topic.default.id
  depends_on = [
    google_pubsub_topic_iam_binding.default
  ]
}

output "schema" {
  description = "Schema resource."
  value       = try(google_pubsub_schema.default[0], null)
}

output "schema_id" {
  description = "Schema resource id."
  value       = try(google_pubsub_schema.default[0].id, null)
}

output "subscription_id" {
  description = "Subscription ids."
  value = {
    for k, v in google_pubsub_subscription.default : k => v.id
  }
  depends_on = [
    google_pubsub_subscription_iam_binding.default
  ]
}

output "subscriptions" {
  description = "Subscription resources."
  value       = google_pubsub_subscription.default
  depends_on = [
    google_pubsub_subscription_iam_binding.default
  ]
}

output "topic" {
  description = "Topic resource."
  value       = google_pubsub_topic.default
  depends_on = [
    google_pubsub_topic_iam_binding.default
  ]
}