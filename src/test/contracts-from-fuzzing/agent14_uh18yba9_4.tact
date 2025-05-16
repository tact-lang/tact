struct Inner {
    a: Int = 42;
    b: Bool = true;
}

struct Outer {
    inner: Inner?;  // make optional
    x: Int = 1;
}

contract NestedDefaultsOptionalInner {
    data: Outer;

    init() {
        self.data = Outer{};   // rely on defaults + null optional
    }
}