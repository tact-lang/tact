struct InnerMost {
    a: Int;
    b: String;
}

struct MiddleLevel {
    c: Int;
    d: InnerMost;
}

struct OuterLevel {
    e: MiddleLevel;
    f: Bool;
}

contract DeepNesting4 {
    st: OuterLevel;

    init() {
        self.st = OuterLevel{
            e: MiddleLevel{
                c: 3,
                d: InnerMost{
                    a: 1,
                    b: "x"
                }
            },
            f: true
        };
    }
}