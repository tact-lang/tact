message MyMessage { value: Int; }

contract BounceTest1 {
    // A basic bounce receiver using a typed bounced message
    bounced(msg: bounced<MyMessage>) {
        // No-op
    }
}
