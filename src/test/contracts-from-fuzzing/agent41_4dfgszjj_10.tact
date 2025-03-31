// Comprehensive Fuzz Testing Cycle for Bounced Messages and Bounce Receiver Functionality

// Test 1: Basic Bounce Receiver with Typed Parameter
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


// Test 2: Bounce Sender with Function Triggering Bounce (using a failing receiver)
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
    
    // Function to send a bounceable message
    fun sendMessage(addr: Address) {
        send(SendParameters {
            to: addr,
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Test Message".asComment(),
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


// Test 3: Raw Bounce Receiver Handling (using raw Slice instead of a typed message)
contract RawBounceReceiver {
    // bounced receiver handling all bounced messages as raw Slice
    bounced(rawMsg: Slice) {
        // In a live scenario, rawMsg could be decoded from bounced message cell
    }
}


// Test 4: Duplicate Bounce Receivers in Single Contract
contract DuplicateBounce {
    // First bounced receiver using a typed message
    bounced(msg: bounced<MyMsg>) {
        // Handling typed bounced messages
    }
    
    // Second bounced receiver using a raw Slice
    bounced(rawMsg: Slice) {
        // Handling all bounced messages
    }
}

message MyMsg {
    dummy: Int;
}


// Test 5: Incorrect Bounce Receiver Declaration (expected compilation failure)
// This snippet is commented out intentionally since it should fail to compile
/*
contract WrongBounce {
    // Incorrect: using plain MyMsg instead of bounced<MyMsg>
    bounced(msg: MyMsg) {
        // This should trigger a compilation error: message type must be wrapped in 'bounced<>'.
    }
}

message MyMsg {
    dummy: Int;
}
*/


// Test 6: Bounce Receiver and Sender Interaction
contract BounceReceiver {
    // This contract forces bounce by failing its receive function
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


// Test 7: Multi-Contract Recursive Bounce Scenario
contract ContractA {
    flag: Int;

    init() {
        self.flag = 0;
    }

    // When a bounced message is received, increment flag and send back a bounce
    bounced(msg: bounced<BMsg>) {
        self.flag = self.flag + 1;
        // Bounce the message back
        send(SendParameters {
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: "Recursion from A".asComment(),
            bounce: true
        });
    }

    // Regular receive function
    receive() {
        // Could be used to initiate bounce chain
    }
}

contract ContractB {
    flag: Int;

    init() {
        self.flag = 0;
    }

    // When a bounced message is received, increment flag and bounce back
    bounced(msg: bounced<BMsg>) {
        self.flag = self.flag + 2;
        // Bounce the message back
        send(SendParameters {
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: "Recursion from B".asComment(),
            bounce: true
        });
    }

    // Regular receive function
    receive() {
        // Could be used to start the recursive bouncing
    }
}

message BMsg {
    dummy: Int;
}
