struct Inner {
    s: String = "str";
}

struct Outer {
    opt: Inner?;
}

contract Test {
    nestedOpt: Outer = Outer{};
    init() {}
}
