struct InnerMost {
    a: Int = 100;
    b: Bool = false;
}

struct Inner {
    im: InnerMost = InnerMost{};
    msg: String = "default";
}

struct Top {
    i: Int = 0;
    inner: Inner = Inner{};
}

contract DeepDefaultNest {
    data: Top = Top{};
}