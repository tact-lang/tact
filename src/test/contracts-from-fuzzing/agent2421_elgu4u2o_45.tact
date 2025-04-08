struct SInner {
    a: Int;
    b: Bool?;
}

struct SMiddle {
    inner: SInner;
    s: String;
}

struct SOuter {
    middle: SMiddle;
    flag: Bool;
}

contract NestStructOpt {
    nested: SOuter;
    init() {
        self.nested = SOuter{
            middle: SMiddle{
                inner: SInner{ a: 1, b: null },
                s: "abc"
            },
            flag: true
        };
    }
}