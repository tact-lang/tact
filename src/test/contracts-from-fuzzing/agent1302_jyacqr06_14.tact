struct S {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as coins;
    s: String;
    flag: Bool;
    optI: Int?;
    optB: Bool?;
}
contract ManySerializationFormats {
    data: S;

    init() {
        self.data = S{
            a: 1,
            b: 2,
            c: 3,
            d: 1000000000000,
            e: 123456789,
            s: "serialize",
            flag: true,
            optI: null,
            optB: false
        };
    }

    receive() {
        let f = self.data.d;
        let s = self.data.s;
    }
}
