message BounceMsg {
    data: Int;
}

contract DoubleBounced {
    bounced(raw: Slice) {
        // This is the fallback bounce receiver for raw messages
    }
    bounced(msg: bounced<BounceMsg>) {
        // Specific bounced message receiver for BounceMsg
    }
}
