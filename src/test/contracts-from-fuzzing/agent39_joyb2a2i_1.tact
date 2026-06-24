message SomeMsg {
    val: Int;
}

contract BounceTest {
    bounced(msg: bounced<SomeMsg>) {
        // Valid bounced receiver using typed bounced message
    }
}
