struct DeepInner {
    z: Bool = false;
}

struct Inner {
    a: Int = 1;
    b: DeepInner = DeepInner{};
}

contract TestContract {
    nestedField: Inner = Inner{};
    init() {}
}
