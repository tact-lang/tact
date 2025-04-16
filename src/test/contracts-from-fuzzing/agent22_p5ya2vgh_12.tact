struct InnerMost {
    x: Int;
    y: Bool;
}

struct MidLevel {
    inner: InnerMost;
    label: String;
}

struct TopLevel {
    mid: MidLevel;
    flag: Bool;
}

contract DeepPlainNest {
    storage: TopLevel;

    init() {
        self.storage = TopLevel{
            mid: MidLevel{
                inner: InnerMost{ x: 123, y: true },
                label: "ok"
            },
            flag: false
        };
    }
}
