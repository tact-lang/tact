message MyMsg {
    value: Int;
}

contract BounceTest1 {
    bounced(msg: bounced<MyMsg>) {
        // Standard bounce receiver with typed parameter
    }
}
