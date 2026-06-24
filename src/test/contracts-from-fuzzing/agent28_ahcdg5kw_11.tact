message MsgA {
    data: Int as uint8; // 8-bit unsigned integer, fits within 224 bits
}

contract MultiBounceSm {
    // Typed bounce receiver for MsgA
    bounced(msg: bounced<MsgA>) {
        let x = msg.data;
    }

    // Fallback bounce receiver for any bounced message
    bounced(rawMsg: Slice) {
        // Fallback: do nothing
    }
}
