message MsgOne {
    // Using a small field type to fit in 224 bits, let’s use a Boolean which is very small
    flag: Bool;
}

contract BounceReceiver_Duplicate {
    // First bounced receiver using typed parameter
    bounced(msg: bounced<MsgOne>) {
        let f = msg.flag;
    }

    // Second bounced receiver using raw Slice
    bounced(raw: Slice) {
        // This is a duplicate bounce receiver
    }
}
