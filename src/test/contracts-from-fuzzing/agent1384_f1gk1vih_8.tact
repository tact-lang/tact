struct Serial {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as coins;
}

contract SerializedFields {
    data: Serial;

    init() {
        self.data = Serial{
            a: 5,
            b: 500,
            c: 50000,
            d: -12345,
            e: ton("1")
        };
    }
}