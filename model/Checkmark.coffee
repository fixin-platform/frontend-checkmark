Transformations["Checkmark"] = (object) -> Transformations.static(Checkmarks.Checkmark, object)
Checkmarks = Collections["Checkmark"] = new Mongo.Collection("Checkmarks", {transform: if Meteor.isClient then Transformations.Checkmark else null})

class Checkmarks.Checkmark
  constructor: (doc) ->
    _.extend(@, doc)

CheckmarkPreSave = (userId, changes) ->
  now = new Date()
  changes.updatedAt = changes.updatedAt or now

Checkmarks.before.insert (userId, Checkmark) ->
  Checkmark._id ||= Random.id()
  now = new Date()
  _.defaults(Checkmark,
    userId: userId
    updatedAt: now
    createdAt: now
  )
  throw new Meteor.Error("Checkmark:userId:empty", "Checkmark::userId is empty", Checkmark) if not Checkmark.userId
  CheckmarkPreSave.call(@, userId, Checkmark)
  true

Checkmarks.before.update (userId, Checkmark, fieldNames, modifier, options) ->
  modifier.$set = modifier.$set or {}
  CheckmarkPreSave.call(@, userId, modifier.$set)
  true
