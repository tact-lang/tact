struct Wide {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool?;
    e: Int?;
    f: String;
    g: String?;
    h: Address;
    i: Address?;
}

contract Test {
    data: Wide;

    init() {
        self.data = Wide{
            a: 1,
            b: 2,
            c: true,
            d: null,
            e: null,
            f: "hi",
            g: null,
            h: myAddress(),
            i: null,
        };
    }
}