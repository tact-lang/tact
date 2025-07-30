struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixTypes {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null,
        };
    }
}