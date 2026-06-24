struct Big {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract BigStructField {
    storage: Big;

    init() {
        self.storage = Big{
            a: 10,
            b: "hi",
            c: false,
            d: null,
            e: null,
            f: true
        };
    }
}