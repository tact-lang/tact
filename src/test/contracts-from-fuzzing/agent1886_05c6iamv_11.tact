struct SerializeWidths {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint4;
}

contract TestSerializeWidths {
    data: SerializeWidths;

    init() {
        self.data = SerializeWidths{
            a: 1,
            b: -10,
            c: 1000,
            d: -123456789,
            e: 8
        };
    }
}