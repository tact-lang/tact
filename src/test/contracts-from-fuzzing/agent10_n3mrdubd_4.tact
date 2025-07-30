message MyMsg {
    data: String;
}

contract MultiBounce {
    // Typed bounced message receiver for MyMsg
    bounced(msg: bounced<MyMsg>) {
        // Process the bounced message with type MyMsg
    }

    // Fallback bounced message receiver for any bounced message not matching the above
    bounced(_msg: Slice) {
        // Fallback handler for bounced messages
    }
}
