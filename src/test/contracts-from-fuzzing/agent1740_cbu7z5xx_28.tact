struct Various {
    a: Int as int8;
    b: Int as uint16;
    c: Int;
    d: Bool;
    e: String;
    f: Address;
    g: Int?;
}

contract VariousFields {
    v: Various;

    init() {
        self.v = Various {
            a: -10,
            b: 1000,
            c: 777,
            d: true,
            e: "hello",
            f: myAddress(),
            g: null
        };
    }
}