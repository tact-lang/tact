contract DuplicateBounce {
    // Attempt to define two bounced receivers in the same contract: one with a typed message and one with a raw message
    bounced(msg: bounced<MyMsg>) {
        // Handle typed bounce message
    }
    
    bounced(rawMsg: Slice) {
        // Handle all bounced messages
    }
}

message MyMsg {
    dummy: Int;
}
