message BounceMsg {
    value: Int;
}

contract BounceTest {
    bounced(msg: bounced<BounceMsg>) {
        // Correctly defined bounced receiver – do nothing.
    }
}
