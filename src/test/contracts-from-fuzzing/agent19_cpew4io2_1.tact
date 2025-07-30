message MyMsg {
    dummy: Int;
}

contract BounceTest1 {
    bounced(msg: bounced<MyMsg>) {
        // Basic bounce receiver
    }
}
