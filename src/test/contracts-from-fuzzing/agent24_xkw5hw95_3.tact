message BounceMsg {
    ok: Bool;
}

contract BasicBounce {
    bounced(msg: bounced<BounceMsg>) {
        // Standard bounced receiver with a typed bounce message
    }
}
