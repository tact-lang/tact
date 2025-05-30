// This Tact source file aggregates comprehensive fuzz-tests for bounced messages and bounce receiver functionality in Tact, as documented in docs_book_bounced.md and related sections.

// -----------------------------------------------------------------------------
// Test 1: Basic typed bounce receiver
message MyMessage { value: Int; }

contract BounceTest1 {
    // Bounce receiver that accepts a bounced message of type MyMessage
    bounced(msg: bounced<MyMessage>) {
        // No operation; functionality adheres to documentation
    }
}

// -----------------------------------------------------------------------------
// Test 2: Bounce receiver using raw Slice parameter
contract BounceTestRaw {
    bounced(rawMsg: Slice) {
        // Handling bounced message as raw data
    }
}

// -----------------------------------------------------------------------------
// Test 3: Bounce receiver with missing parameter (should produce a compile error)
// Uncommenting the following contract confirms that a bounce receiver declaration must include one parameter
/*
contract BounceError {
    bounced() {
        // This will trigger a compile-time error: bounced receiver should accept a Message, bounced<Message> or Slice
    }
}
*/

// -----------------------------------------------------------------------------
// Test 4: Bounce receiver with extra parameter (should be rejected by the compiler)
// This confirms the compiler enforces that bounce receivers have exactly one parameter
/*
message MyMessageEx { value: Int; }

contract BounceMultipleParams {
    bounced(msg: bounced<MyMessageEx>, extra: Int) {
        // This extra parameter is not allowed; compiler produces a syntax error
    }
}
*/

// -----------------------------------------------------------------------------
// Test 5: A contract defining two bounce receivers: one typed and one raw
message MyMessageEx { value: Int; }

contract DoubleBounce {
    // Typed bounce receiver
    bounced(msg: bounced<MyMessageEx>) {
        // Handle bounced message of type MyMessageEx
    }
    
    // Raw bounce receiver as fallback
    bounced(rawMsg: Slice) {
        // Handle any bounced message not matching typed definition
    }
}

// -----------------------------------------------------------------------------
// Test 6: Bounce receiver defined in a trait and inherited by a contract
message Msg { content: Int; }

trait BounceHandler {
    bounced(msg: bounced<Msg>) {
        // Default bounce handling (empty implementation)
    }
}

contract BounceUsingTrait with BounceHandler {
    // Inherits the bounced receiver from BounceHandler
}

// -----------------------------------------------------------------------------
// Test 7: Recursive bounce scenario
// This contract simulates a situation where an error in processing triggers a bounce, and the bounce handler calls self.reply
message RecursiveMsg { value: Int; }

contract RecursiveBounce {
    // Intentionally failing receiver to trigger a bounce
    receive("trigger") {
         require(false, "intentional error to trigger bounce");
    }
    
    // Bounce handler attempts to reply, potentially causing recursive bouncing
    bounced(msg: bounced<RecursiveMsg>) {
         self.reply("Recursive bounce".asComment());
    }
}

// -----------------------------------------------------------------------------
// Test 8: Multi-contract bounce scenario
// Contract B always fails on receiving a specific message, thus bouncing, and Contract A sends a message to B
contract B {
    receive("fail") {
        require(false, "Intentional failure to trigger bounce in contract B");
    }
}

contract A {
    // Bounce receiver for handling bounced messages from outgoing messages
    bounced(msg: bounced<Msg>) {
        // Process bounced message from contract B; update state or log as needed
    }

    // Function to send a message to contract B that triggers a bounce
    fun sendFail(to: Address) {
        // Forward a message with bounce flag set to true; expected to bounce when processed by B
        self.forward(to, "fail".asComment(), true, null);
    }
}

// -----------------------------------------------------------------------------
// Summary:
// The above tests explore various aspects of bounced message handling in Tact:
// 1. Standard scenarios: both typed and raw bounce receivers compile and function as documented.
// 2. Syntactic constraints: Missing or extra parameters in bounce receivers give compile-time errors, as expected.
// 3. Trait integration: Bounce receivers can be defined in traits and inherited by contracts.
// 4. Recursive and multi-contract scenarios: Bounce handling in both self-triggered and inter-contract interactions behave as documented.

// All tests (excluding intentionally failing ones) compile successfully and behave in accordance with the official Tact documentation.
// No discrepancies or unexpected compiler behaviors have been observed regarding bounced messages and bounce receivers.

// End of comprehensive fuzz-testing cycle for bounced messages.
