struct Inner {
    x: Int = 1;
}

struct Outer {
    y: Int = 2;
    z: Inner? = null;
}

contract DeepNest {
    data: Outer = Outer{};
    init() {}
}