message MyMsg {
    val: Int;
}

contract MultiBounceTest {
    // Bounce receiver for typed bounced message
    bounced(msg: bounced<MyMsg>) {
        // Handler code for MyMsg
    }

    // Fallback bounce receiver using raw Slice
    bounced(raw: Slice) {
        // Fallback handler for any bounced message
    }
}
