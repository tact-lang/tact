struct SerialOrder {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as int64;
}

contract SerializationCheck {
    item: SerialOrder;

    init() {
        self.item = SerialOrder{
            a: 5,
            b: 8,
            c: 16,
            d: 32,
            e: 64,
        };
    }
}
