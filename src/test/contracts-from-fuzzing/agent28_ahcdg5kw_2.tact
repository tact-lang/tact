message MyMsg {
    val: Int;
}

contract BounceTest {
    bounced(msg: bounced<MyMsg>) {
        // Do nothing with the bounced message
    }
}
