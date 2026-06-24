message TestMessage {
    value: Int;
}

contract BounceTest {
    bounced(msg: bounced<TestMessage>) {
        // minimal bounced message receiver that does nothing
    }
}
