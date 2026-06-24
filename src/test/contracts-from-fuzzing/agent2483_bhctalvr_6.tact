struct InnerMost {
    flag: Bool?; 
}

struct Inner {
    innerMost: InnerMost = InnerMost{};
}

struct Outer {
    inner: Inner = Inner{};
}

contract TestContract {
    nestedField: Outer = Outer{};
    init() {}
}