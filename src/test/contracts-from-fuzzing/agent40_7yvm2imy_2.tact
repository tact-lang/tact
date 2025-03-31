message BounceMsg {
    data: Int;
}

contract BounceTest {
    bounced(msg: bounced<BounceMsg>) {
        // Standard bounce receiver function using a message struct type.
    }
}
