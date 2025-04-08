struct InnerMost {
    a: Int = 1;
    b: Bool? = null;
}

struct Middle {
    x: InnerMost = InnerMost{};
    y: String = "hi";
}

struct Outer {
    m: Middle = Middle{};
    z: Int? = null;
}

contract TestContract {
    data: Outer = Outer{};

    init() {}
}