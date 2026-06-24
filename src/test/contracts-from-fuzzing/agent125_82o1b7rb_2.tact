struct DeepNest {
    inner: SimpleInner;
}

struct SimpleInner {
    value: Int;
}

contract TestContract {
    foo: DeepNest;
    init() {
        self.foo = DeepNest{ inner: SimpleInner{ value: 123 } };
    }
}