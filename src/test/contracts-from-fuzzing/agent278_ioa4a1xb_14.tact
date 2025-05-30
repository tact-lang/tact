struct Middle {
    a: Int;
    b: InnerMost;
    c: String;
}

struct InnerMost {
    d: Bool;
    e: Int?;
}

contract MixedNestOpt {
    state: Middle;
    init() {
        self.state = Middle{
            a: 1,
            b: InnerMost{
                d: false,
                e: null
            },
            c: "x"
        };
    }
}