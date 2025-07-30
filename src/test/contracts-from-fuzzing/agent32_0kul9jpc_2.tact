message MyMessage {
    x: Int;
}

contract BounceTest {
    bounced(msg: bounced<MyMessage>) {
        // simply receive bounced message without accepting or performing actions
    }
}
