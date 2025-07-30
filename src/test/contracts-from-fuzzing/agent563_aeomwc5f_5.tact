struct Inner {
    x: Int = 10;
    y: Bool = true;
}

struct Outer {
    foo: Int = 5;
    nested: Inner;
}

contract NestedDefaults {
    data: Outer;

    init() {
        self.data = Outer{ nested: Inner{} };
    }
}