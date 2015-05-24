###
# This method returns a new function that, when executed,
# executes fn and returns the current value of <this>.
# Useful for chaining methods together á la jQuery.
###
module.exports = (fn) ->
	(args...) ->
		fn.apply this, args
		this
