# Mini Tweet Clone

This is a mini project using Rails 8 and Turbo 8. It is a practice of how to use the `broadcasts_refreshes`, a Turbo-Rails model helper that automatically triggers a Turbo Stream `refresh` broadcast whenever a record changes.

## Example Use

```ruby
class Tweet < ApplicationRecord
  broadcasts_refreshes
end
```

Any client subscribed with `turbo_stream_from @tweets` or `turbo_stream_from @tweet` will automatically get updated HTML when a message changes.
