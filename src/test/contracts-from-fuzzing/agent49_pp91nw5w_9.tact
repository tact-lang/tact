struct InnerMost {
    d: Int;
}

struct Mid {
    c: InnerMost;
}

struct Outer {
    b: Mid;
}

contract Deeply {
    a: Outer;

    init() {
        self.a = Outer{b: Mid{c: InnerMost{d: -100}}};
    }
}