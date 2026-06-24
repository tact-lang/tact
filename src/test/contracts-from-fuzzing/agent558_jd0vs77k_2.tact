struct Inner {
    z: Bool?;
    y: Int = 7;
}

contract Test {
    foo: Inner = Inner{};

    init() {
        self.foo = Inner{
            z: true,
            y: 42,
        };
    }
}