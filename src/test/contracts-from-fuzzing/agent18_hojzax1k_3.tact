message MyMsg {
    value: Int;
}

contract MultipleBounce {
    bounced(msg: bounced<MyMsg>) {
        // First bounced receiver, handling typed bounced message
    }

    bounced(raw: Slice) {
        // Second bounced receiver, handling raw bounced message
    }
}
