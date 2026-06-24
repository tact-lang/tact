struct InnerMost {
    u: Int = 11;
    v: Bool? = null;
}

struct Middle {
    x: Int? = 12;
    y: Bool = true;
    z: InnerMost = InnerMost{};
}

contract ComplexInit {
    data: Middle = Middle{};
}