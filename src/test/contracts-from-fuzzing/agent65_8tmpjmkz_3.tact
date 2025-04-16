struct BigOne {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
    d: Bool;
    e: Bool;
    f: Int?;
    g: Address;
    h: String;
    i: String?;
}

contract WideState {
    stuff: BigOne;

    init() {
        self.stuff = BigOne{
            a: 1,
            b: 255,
            c: -1234567890,
            d: true,
            e: false,
            f: null,
            g: myAddress(),
            h: "hello",
            i: null
        };
    }
}