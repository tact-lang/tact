message MyMsg {
    value: Int;
}

contract DoubleBounceReceiver {
    bounced(msg: bounced<MyMsg>) {
        // First bounce receiver
    }

    bounced(rawMsg: Slice) {
        // Second bounce receiver handling raw messages
    }
}
