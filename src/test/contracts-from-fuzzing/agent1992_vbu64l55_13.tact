struct Inner {
    foo: Int = 123;
    bar: Bool = false;
}

struct Outer {
    inner: Inner = Inner{};
    x: Int = 5;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}