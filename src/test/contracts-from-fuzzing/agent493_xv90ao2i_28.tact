struct InnerMost {
    x: Int;
}

struct Inner {
    z: InnerMost;
}

struct Mid {
    y: Inner;
}

struct Outer {
    m: Mid;
}

contract DeepNestChain {
    c: Outer;

    init() {
        self.c = Outer{ m: Mid{ y: Inner{ z: InnerMost{ x: 777 } } } };
    }
}