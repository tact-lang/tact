message MyMsg {
    value: Int as uint64;
}

message YourMsg {
    text: String;
}

contract MultiBounce {
    // Bounce receiver for messages of type MyMsg
    bounced(msg: bounced<MyMsg>) {
        // Handle MyMsg bounced message
    }

    // Bounce receiver for messages of type YourMsg
    bounced(msg: bounced<YourMsg>) {
        // Handle YourMsg bounced message
    }

    // Fallback raw bounce receiver that catches any not matched
    bounced(raw: Slice) {
        // Fallback handler for bounced messages
    }
}
