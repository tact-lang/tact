struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixTypes {
    storage: Combo;
    init() {
        self.storage = Combo{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: false,
            f: null
        };
    }
}