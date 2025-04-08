struct MixTypes {
    a: Int;
    b: Bool;
    c: String?;
    d: Bool?;
    e: Int?;
}

contract MixOpt {
    st: MixTypes;

    init() {
        self.st = MixTypes{
            a: 1,
            b: false,
            c: null,
            d: null,
            e: null
        };
    }
}