message A {}
message B {}

contract DoubleTypedBounce {
    bounced(msg: bounced<A>) {
        // Handler for messages of type A
    }

    bounced(msg: bounced<B>) {
        // Handler for messages of type B
    }
}
