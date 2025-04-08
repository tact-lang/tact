struct StringWrap {
    s: String;
}

struct WrapWrap {
    a: StringWrap;
    b: StringWrap;
}

contract MultiStrWrap {
    w: WrapWrap;

    init() {
        self.w = WrapWrap{
            a: StringWrap{ s: "one" },
            b: StringWrap{ s: "two" }
        };
    }
}