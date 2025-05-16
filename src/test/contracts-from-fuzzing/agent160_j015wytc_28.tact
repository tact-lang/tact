struct BigMixed {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
    g: Address;
    h: Address?;
    i: Int = 99;
    j: String?;
}

contract MixedHolder {
    inner: BigMixed;
    init() {
        self.inner = BigMixed{
            a: 1,
            b: null,
            c: "hi",
            d: null,
            e: true,
            f: false,
            g: myAddress(),
            h: null,
            j: null
        };
    }
}