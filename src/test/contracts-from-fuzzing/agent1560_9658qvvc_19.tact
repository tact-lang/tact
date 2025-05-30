struct Mix {
    i: Int;
    b: Bool;
    s: String;
    optInt: Int?;
    optStr: String?;
    nested: Inner;
}

struct Inner {
    x: Int as uint8;
    y: Bool;
}

contract MixedNestedOptional {
    f: Mix;
    init() {
        self.f = Mix{
            i: 1,
            b: false,
            s: "hi",
            optInt: null,
            optStr: null,
            nested: Inner{ x: 255, y: true },
        };
    }
}