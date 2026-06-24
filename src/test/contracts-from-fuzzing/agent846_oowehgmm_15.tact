struct S {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Int as uint8;
    f: Int as int16;
    g: Address;
}

contract Test {
    val: S;

    init() {
        self.val = S{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: 255,
            f: -1000,
            g: myAddress()
        };
    }
}