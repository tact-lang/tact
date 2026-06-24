message MyMsg {
    counter: Int as uint8;
}

contract BounceConflict {
    // Specific bounced receiver for MyMsg
    bounced(msg: bounced<MyMsg>) {
        // This bounce handler is intended for MyMsg type messages
    }

    // Fallback bounced receiver for any bounced message
    bounced(raw: Slice) {
        // This fallback handler will catch all other bounced messages
    }

    receive() {}
}
