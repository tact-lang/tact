struct Mix {
    a: Int;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
    f: String;
}

contract MixedPersistent {
    m: Mix;

    init() {
        self.m = Mix{
            a: 1,
            b: null,
            c: "hi",
            d: 2,
            e: false,
            f: "bye",
        };
    }
}