struct InnerMost {
    p: Int?;
    txt: String;
}

struct MidLevel {
    inner: InnerMost;
    flag: Bool;
}

struct Outer {
    mid: MidLevel;
    n: Int;
    s: String?;
}

contract OptionalDeep {
    store: Outer?;

    init() {
        self.store = Outer{
            mid: MidLevel{
                inner: InnerMost{ p: null, txt: "hello" },
                flag: true
            },
            n: 7,
            s: null
        };
    }
}