/* Test 2: Double bounced definitions in a single contract */

message BouncedMsg {
    num: Int;
}

contract TestDoubleBounced {
    // A bounced receiver handling structured bounced message
    bounced(msg: bounced<BouncedMsg>) {
        // Empty body
    }
    
    // A bounced receiver handling raw slice messages
    bounced(rawMsg: Slice) {
        // Empty body
    }
}
