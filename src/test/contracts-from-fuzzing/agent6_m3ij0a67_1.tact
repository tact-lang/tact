message TestMsg {
    data: Int;
}

contract BounceTest1 {
    bounced(msg: bounced<TestMsg>) {
        // Valid bounced receiver implementation
    }
}
