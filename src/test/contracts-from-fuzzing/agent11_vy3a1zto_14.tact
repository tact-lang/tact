message SmallMsg {
    // Using "as uint16" to limit the field size, ensuring it fits in 224 usable data bits
    value: Int as uint16;
}

contract BounceSmallMsg {
    bounced(msg: bounced<SmallMsg>) {
        let x: Int = msg.value;
    }
}
