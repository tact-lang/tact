struct MixEmbedded {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract MixEmbedContract {
    data: MixEmbedded;

    init() {
        self.data = MixEmbedded{
            a: 42,
            b: false,
            c: "yo",
            d: null,
            e: "sup",
            f: null,
        };
    }
}