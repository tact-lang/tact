struct DeepChild {
    a: Int;
    b: String;
}

struct MidLevel {
    c: Bool;
    d: DeepChild;
}

struct TopLevel {
    e: String;
    f: MidLevel;
}

contract DeepNest {
    stored: TopLevel;

    init() {
        self.stored = TopLevel{
            e: "test",
            f: MidLevel{
                c: true,
                d: DeepChild{a: 10, b: "deep"}
            }
        };
    }
}