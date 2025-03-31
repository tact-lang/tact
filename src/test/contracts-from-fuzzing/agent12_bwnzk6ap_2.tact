message MyMsg {
    counter: Int;
}

contract BounceTest {
    bounced(msg: bounced<MyMsg>) {
        // Minimal bounce handler
    }
}
