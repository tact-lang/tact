struct Inner {
    x: Int = 1;
    y: Bool = false;
}

contract DefaultsStorage {
    foo: Inner;

    init() {
        self.foo = Inner{};
    }
}