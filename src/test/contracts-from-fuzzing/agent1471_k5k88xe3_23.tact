struct InnerStr {
    a: Int;
    b: Bool;
}

struct OuterStr {
    nested: InnerStr;
    c: String;
}

struct Topper {
    x: OuterStr;
    y: OuterStr;
}

contract MultiOuter {
    state: Topper;
    init() {
        self.state = Topper{
            x: OuterStr{
                nested: InnerStr{a: 1, b: true},
                c: "alpha"
            },
            y: OuterStr{
                nested: InnerStr{a: 2, b: false},
                c: "beta"
            }
        };
    }
}