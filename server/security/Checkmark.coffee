Checkmarks.allow
  insert: introspect (userId, checkmark) ->
    throw new Match.Error("Authentication required") if not userId
    check checkmark,
      _id: Match.StringId
      model: String
      handle: String
      userId: userId
      updatedAt: Date
      createdAt: Date
    true
  update: introspect (userId, checkmark, fieldNames, modifier, options) ->
    throw new Match.Error("Can't update existing checkmark (remove it instead)")
  remove: introspect (userId, checkmark) ->
    throw new Match.Error("Authentication required") if not userId
    throw new Match.Error("Only owner can do this") if checkmark.userId isnt userId
    true
