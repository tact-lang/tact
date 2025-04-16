struct MixTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    data: MixTypes;

    init() {
        self.data = MixTypes{
            a: 42,
            b: true,
            c: "abc",
            d: null,
            e: false,
            f: null
        };
    }
}