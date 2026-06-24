struct InnerMost {
    d: Int;
}

struct MiddleLevel {
    c: InnerMost;
}

struct OuterLevel {
    b: MiddleLevel;
}

contract ThreeLevel {
    a: OuterLevel = OuterLevel{b: MiddleLevel{c: InnerMost{d: 42}}};
}