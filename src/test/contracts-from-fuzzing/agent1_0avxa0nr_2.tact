message MyBounce {
    value: Int;
}

contract BounceTest2 {
    // Proper bounce receiver using a struct message type
    bounced(msg: bounced<MyBounce>) {
        // no operations, simply a receiver
    }
    
    // Fallback bounce receiver receiving a raw Slice
    bounced(rawMsg: Slice) {
        // Intended to capture any bounced message
    }
}
