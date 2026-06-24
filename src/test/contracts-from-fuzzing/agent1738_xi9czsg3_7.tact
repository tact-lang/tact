struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract Test {
    storage: Big;

    init() {
        self.storage = Big{
            a: 1,
            b: true,
            c: "text",
            d: myAddress(),
            e: null,
            f: null,
            g: null,
            h: null
        };
    }
}
