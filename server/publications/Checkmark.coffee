Meteor.publish("Checkmarks", ->
  return [] unless @userId
  Checkmarks.find({userId: @userId})
)
