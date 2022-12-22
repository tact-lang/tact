# Contract

TACT contract defines:

* Fields
* init function
* Receivers
* get functions

## Init function

> **Warning**
> Init function checks are not implemented fully, be careful and check manually that everything is fine before going to production.

```
contract Sample {
  field: Int;
  
  init(value: Int) {
    self.field = value;
  }
}
```

## Receivers

Receivers are handlers of incoming messages, receivers can't be called directly.

They could be defined for multiple types of messages.

* Empty receiver
* Comment receiver
* Comment fallback receiver
* Message receiver
* Fallback receiver
* Bounced receiver

### Empty receiver

This receiver for empty message or message with an empty comment:

```
contract Sample {

  // ...
  
  receive() {
    // This receiver called for emtpy messages
  }
}
```

## Comment receiver

This receiver is for some static comment

```
contract Sample {

  // ..
  
  receive("hello") {
    // This receiver called for a messages with "hello" comment
  }
}
```

## Comment fallback receiver

This receiver allows to receive arbitrary comment message

```

contract Sample {
  
  // ..

  receive(msg: String) {
    // This receiver called for a any text message that wasn't matched by other receivers
  }
}
```



## Message receiver

This receiver is for binary messages.

```

message Hello {
  value: Int;
}

contract Sample {

  // ..
  
  receive(msg: Hello) {
    // This receiver called for a message of type Hello
  }
}
```

## Fallback receiver

This receiver is for messages that didn't match to any previous one

```
contract Sample {

  // ..

  receive(msg: Slice) {
    // This receiver called for any unmatched message
  }
}
```

## Bounced receiver

This receiver is for messages that was bounced. This is for very advanced users: contract receives only 256 bits from bounced message

```
contract Sample {

  // ..

  bounced(msg: Slice) {
    // This receiver called for any bounced message
  }
}
