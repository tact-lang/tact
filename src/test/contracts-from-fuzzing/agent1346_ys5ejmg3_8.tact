struct InnerDefault {
    foo: Int = 42;
}

struct OuterDefault {
    inner: InnerDefault = InnerDefault{};
    bar: Bool = false;
}

contract DefaultsNested {
    state: OuterDefault = OuterDefault{};
    testVal: Int = 0;

    init() {
        self.testVal = self.state.inner.foo;
    }
}
