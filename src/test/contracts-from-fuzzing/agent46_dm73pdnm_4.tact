// Test 1: Bounce receiver with discard parameter

message MyMsg {
    value: Int;
}

contract BounceDiscard {
    bounced(_msg: bounced<MyMsg>) {
        // Correct usage: parameter is discarded
    }
    
    receive() {
        // Minimal receive to allow contract deployment
    }
}
