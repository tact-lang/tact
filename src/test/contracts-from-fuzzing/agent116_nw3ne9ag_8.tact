contract OptionalWithSerialization {
    data: Data;

    init() {
        self.data = Data{
            a: null,
            b: 5,
            c: null,
            d: 300,
            e: null,
            f: 2_000_000_000
        };
    }
}

struct Data {
    a: Int? as uint8;
    b: Int as int16;
    c: Int? as int16;
    d: Int as uint32;
    e: Int? as coins;
    f: Int as coins;
}
