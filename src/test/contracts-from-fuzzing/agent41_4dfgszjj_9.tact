// Test 1 - Basic Bounce Receiver with Typed Parameter
contract BounceTest {
    intValue: Int;

    init() {
        self.intValue = 0;
    }

    // bounced receiver handling a typed bounced message MyBouncedMsg
    bounced(msg: bounced<MyBouncedMsg>) {
        self.intValue = 42;
    }
}

message MyBouncedMsg {
    dummy: Int;
}

// Test 2 - Bounce Sender with a Function to Trigger Bounce 
contract FailingReceiver {
    receive() {
        require(false, "Failing Receiver");
    }
}

contract BounceSender {
    recovery: Int;
    
    init() {
        self.recovery = 0;
    }
    
    // Proper function declaration
    fun sendMessage(addr: Address) {
        send(SendParameters {
            to: addr,
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Test".asComment(),
            bounce: true
        });
    }
    
    // bounced receiver handling a typed bounced message
    bounced(msg: bounced<FallbackMsg>) {
        self.recovery = 1;
    }
}

message FallbackMsg {
    dummy: Int;
}

// Test 3 - Raw Bounce Receiver using raw Slice
contract RawBounceReceiver {
    // bounced receiver handling all bounced messages as raw Slice
    bounced(rawMsg: Slice) {
        // In a real scenario, we would decode the raw message (omitted here for brevity)
    }
}

// Test 4 - Duplicate Bounce Receivers in a single Contract
contract DuplicateBounce {
    // First bounced receiver using a typed message
    bounced(msg: bounced<MyMsg>) {
        // Handle typed bounced message
    }
    
    // Second bounced receiver using a raw slice
    bounced(rawMsg: Slice) {
        // Handle all bounced messages
    }
}

message MyMsg {
    dummy: Int;
}

// Test 5 - Incorrect Bounce Receiver Declaration
// This test is expected to fail since using wrong type wrapping in bounced receiver
// Uncommenting the next lines should cause a compilation error:
/*
contract WrongBounce {
    // Incorrect: using plain MyMsg instead of bounced<MyMsg>
    bounced(msg: MyMsg) {
        // Attempt to handle bounced message using wrong type annotation
    }
}

message MyMsg {
    dummy: Int;
}
*/

// Test 6 - Bounce Receiver and Sender Interaction
contract BounceReceiver {
    // This contract fails in receive to force bounce
    receive() {
        require(false, "Force bounce");
    }
}

contract BounceSender2 {
    flag: Int;

    init() {
        self.flag = 0;
    }

    fun triggerBounce(addr: Address) {
        send(SendParameters {
            to: addr,
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Ping".asComment(),
            bounce: true
        });
    }

    // bounced receiver handling a typed bounced message
    bounced(msg: bounced<MyBounceMsg>) {
        self.flag = 1;
    }
}

message MyBounceMsg {
    dummy: Int;
}

// Test 7 - Multi-Contract Recursive Bounce Scenario
contract ContractA {
    flag: Int;

    init() {
        self.flag = 0;
    }

    // Bounce receiver: increments flag and bounces message back to sender
    bounced(msg: bounced<BMsg>) {
        self.flag = self.flag + 1;
        // Bounce message back to sender
        send(SendParameters {
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: "Recursion from A".asComment(),
            bounce: true
        });
    }

    receive() {
        // Regular receive function does nothing here
    }
}

contract ContractB {
    flag: Int;

    init() {
        self.flag = 0;
    }

    // Bounce receiver: increments flag and bounces message back to sender
    bounced(msg: bounced<BMsg>) {
        self.flag = self.flag + 2;
        // Bounce message back to sender
        send(SendParameters {
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: "Recursion from B".asComment(),
            bounce: true
        });
    }

    receive() {
        // Regular receive function does nothing here
    }
}

message BMsg {
    dummy: Int;
}
