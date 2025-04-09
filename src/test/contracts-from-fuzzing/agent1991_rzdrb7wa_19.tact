struct Small {
    foo: Int;
}

struct Larger {
    s1: Small;
    s2: Small;
}

contract NestedPrimitiveMix {
    v1: Small;
    v2: Larger;

    init() {
        self.v1 = Small{ foo: 1 };
        self.v2 = Larger{ s1: Small{ foo: 2 }, s2: Small{ foo:3 } };
    }
}