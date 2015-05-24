# chainable-keyword
One word method chaining with CoffeeScript.

### Wait, _another_ chaining package?
Yes, well. All the other chaining packages are much more complicated than this one.

### (Yawn) we've heard that before.
No, seriously, the _entire_ functionality is in *four* lines of code. I wouldn't have even bothered making it a package if it weren't for the lack of green in my Github activity chart.

What's more, those four lines of code make for a pretty cool way to create chaining API:s.

### Cool, eh?
Ice cold, bro! Just prepend your functions with the word `chainable` and you're good to go!

### A short example maybe?
Your typical API might look like this:
```CoffeeScript
class MyAPI
	run:  -> console.log "running!"
	jump: -> console.log "jumping!"
	swim: -> console.log "swimming!"
```
Now, you would like to be able to do that jQuery thing where you can type:
```CoffeeScript
myApi = new MyAPI()
myapi
	.run()
	.jump()
	.swim()
```

But doing that normally means you have to start doing stuff like this:
```CoffeeScript
class MyAPI
	run:  ->
		console.log "running!"
		return this
	jump: ->
		console.log "jumping!"
		return this
	swim: ->
		console.log "swimming!"
		return this
```
Now your code is littered with loads of the same return statements! That's not cool, and it's not  right for you to have to choose between beautiful API _implementation_ and beautiful API _usage_.

So, what's the alternative? Put this at the top of your file:
```CoffeeScript
chainable = require "chainable-keyword"
```
and rewrite your APIs as follows:
```CoffeeScript
class MyAPI
	run:  chainable -> console.log "running!"
	jump: chainable -> console.log "jumping!"
	swim: chainable -> console.log "swimming!"
```
Now you can chain your API:s to your hearts content. But wait, there's more! If you find yourself writing a method that you for some reason _dont_ want to chain, you simply don't write the `chainable` keyword in the method declaration: 
```CoffeeScript
class MyAPI
	run:  chainable -> console.log "running!"
	jump: chainable -> console.log "jumping!"
	swim: chainable -> console.log "swimming!"
	getAnswer: -> 42 # This method is non-chainable
```
Of course, your API can take arguments in its functions as well:
```CoffeeScript
class MyAPI2
	buy: chainable (item, cost) ->
		console.log "Bought #{item} for #{cost}!"
	sell: chainable (item) ->
		console.log "Sold #{item}"
```

### Wow, that's amazing!
Thank you, I hope you find it useful for your next social-media-platform-with-a-twist startup. 

### How do I install it again?
```
npm install chainable-keyword
```

### Bonus round: Plain Jane Javascript? 
You can of course use the package in a similar sort of way in vanilla Javascript, since `chainable` is a function like any other function:
```JavaScript
function MyAPI() {
	this.run = chainable(function() {
		console.log("running");
	});
	this.jump = chainable(function() {
		console.log("jumping");
	});
	this.swim = chainable(function() {
		console.log("swimming");
	});
}
var myAPI = new MyAPI();
myAPI
	.run()
	.jump()
	.swim();
```

With love, from Mac <3
