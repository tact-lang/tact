message MyMsg {
    value: Int as uint64;
}

contract BounceFallbackTest {
    // Fallback bounce receiver: catches any bounced messages
    bounced(raw: Slice) {
        // Process the raw bounced message
    }

    // Receive function that always fails and therefore triggers bouncing
    receive(msg: MyMsg) {
        require(false, "force bounce");
    }
}
