// Comprehensive Bounce Testing Suite

message MyMessage {
    x: Int;
}

// Test 1: Simple typed bounced receiver
contract BounceTest1 {
    bounced(msg: bounced<MyMessage>) {
        // no-op: verify typed bounce receiver compiles and is accepted
    }
}

// Test 2: Bounce receiver using raw Slice (with valid operation on Slice)
contract BounceTest_RawSlice {
    bounced(rawMsg: Slice) {
        // Convert raw slice to string to simply verify bounce handling
        let s: String = rawMsg.asString();
    }
}

// Test 3: BounceChain
// This contract sends a bounceable message to itself triggering its bounced receiver
contract BounceChain {

    // bounced receiver handling bounced messages of type MyMessage
    bounced(msg: bounced<MyMessage>) {
        // In a bounce event, reply with a comment
        self.reply("Bounced received".asComment());
    }

    // A receive function that triggers sending a bounceable message to self
    receive("trigger") {
        send(SendParameters{
            to: myAddress(),
            value: 0,
            bounce: true,
            body: MyMessage{ x: 123 }.toCell()
        });
    }
}

// Test 4: BounceRecursive
// This contract demonstrates a recursive bouncing scenario where a message
// is sent that eventually bounces and triggers a reply.
contract BounceRecursive {
   receive("start") {
      send(SendParameters{
         to: newAddress(0, 0x1111111111111111111111111111111111111111111111111111111111111111),
         value: 0,
         bounce: true,
         body: "Test bounce".asComment()
      });
   }
   bounced(rawMsg: Slice) {
      // When a bounce is received, reply with a callback message
      self.reply("Bounce callback".asComment());
   }
}

// Test 5: BounceConflict
// This test verifies that a contract can have both a typed bounce receiver and a fallback
// bounce receiver without conflict. The compiler selects the most specific match.
contract BounceConflict {
  // Typed bounce receiver for MyMessage
  bounced(msg: bounced<MyMessage>) {
    // Do nothing
  }

  // Fallback bounce receiver handling any bounced message as a raw Slice
  bounced(rawMsg: Slice) {
    // Convert the raw message to a string as a dummy operation
    let s: String = rawMsg.asString();
  }
}

// Test 6: BounceState
// Verify that state modifications in a bounced receiver take effect and that using self.reply in a bounce handler
// compiles as expected
contract BounceState {
    // persistent state variable
    counter: Int = 0;

    // bounced receiver with typed bounce message
    bounced(msg: bounced<MyMessage>) {
        // Increase counter on bounce
        self.counter = self.counter + 1;
        // Reply with a comment to simulate bounce processing
        self.reply("State updated on bounce".asComment());
    }

    // receive trigger to simulate sending a bounceable message
    receive("trigger") {
        // Send a message to self that is bounceable; if bounce occurs, bounced() will be triggered
        send(SendParameters{
            to: myAddress(),
            value: 0,
            bounce: true,
            body: MyMessage{ x: 999 }.toCell()
        });
    }
}
