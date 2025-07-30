struct Inner {
    x: Int = 11;
    y: Bool = false;
}

struct Outer {
    a: Int = 42;
    nested: Inner = Inner{};
}

contract StructInStructTest {
    nestedData: Outer;

    init() {
        self.nestedData = Outer{};
    }
}