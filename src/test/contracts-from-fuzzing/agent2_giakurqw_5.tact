message MyMessage {
    value: Int;
}

contract BounceTest {
    bounced(msg: bounced<MyMessage>) {
        // Do nothing, simply accept the bounced message as per documentation
    }
}
