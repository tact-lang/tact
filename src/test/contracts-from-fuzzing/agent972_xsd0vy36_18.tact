struct MixTypes {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract TestMixTypes {
    storage: MixTypes;

    init() {
        self.storage = MixTypes{
            a: 1,
            b: null,
            c: "hi",
            d: 42,
            e: false,
            f: null,
        };
    }
}
