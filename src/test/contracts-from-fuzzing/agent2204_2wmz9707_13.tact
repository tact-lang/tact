struct Inner {
    flag: Bool;
    amount: Int as uint8;
    desc: String;
}

struct Middle {
    record: Inner;
    optInner: Inner?;
}

contract OptionalDeep {
    m: Middle;
    init() {
        self.m = Middle{
            record: Inner{ flag: true, amount: 7, desc: "desc" },
            optInner: null
        };
    }
}