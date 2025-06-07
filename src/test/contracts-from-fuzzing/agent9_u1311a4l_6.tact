message A {
    data: Int;
}

contract TestBounceMultiple {
    // Bounce receiver specifically for messages of type A
    bounced(msg: bounced<A>) {
        // Handle specific bounced messages
    }

    // Fallback bounce receiver that catches all bounced messages
    bounced(raw: Slice) {
        // Handle any bounced message that doesn't match previous receivers
    }
}
