struct SerialInts {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as coins;
    f: Int;
}

contract SerialFields {
    data: SerialInts;

    init() {
        self.data = SerialInts{
            a: -5,
            b: 10,
            c: -1000,
            d: 1000,
            e: ton("1"),
            f: 123456
        };
    }

    receive() {
        dump(self.data.f);
    }
}