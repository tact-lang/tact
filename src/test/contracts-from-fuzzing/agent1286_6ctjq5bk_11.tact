struct Variation {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract StoreVariation {
    storage: Variation;

    init() {
        self.storage = Variation{
            a: 99,
            b: false,
            c: "abc",
            d: 123,
            e: null,
            f: null,
        };
    }
}