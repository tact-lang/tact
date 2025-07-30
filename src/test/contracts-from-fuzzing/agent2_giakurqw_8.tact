message MyMessage {
    value: Int;
}

contract TestBothBounced {
    bounced(msg: bounced<MyMessage>) {
        // Typed bounce receiver
    }
    
    bounced(rawMsg: Slice) {
        // Raw bounce receiver
    }
}
