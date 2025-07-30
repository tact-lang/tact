struct InnerInner {
    n: Int = 1;
}

struct Inner {
    x: InnerInner = InnerInner{};
    y: Int = 2;
}

struct Middle {
    a: Inner = Inner{};
    b: Int = 3;
}

contract MultiDeepNested {
    data: Middle = Middle{};
    init() {}
}