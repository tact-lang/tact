struct InnerA {
    foo: Int;
}

struct InnerB {
    bar: Int;
    nestedA: InnerA;
}

struct Middle {
    m1: InnerA;
    m2: InnerB;
    m3: InnerA;
}

contract WideDeepNesting {
    root: Middle;

    init() {
        self.root = Middle{
            m1: InnerA{foo: 1},
            m2: InnerB{bar: 2, nestedA: InnerA{foo: 3}},
            m3: InnerA{foo:4}
        };
    }
}