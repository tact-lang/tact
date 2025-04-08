struct Inner {
    foo: Int;
}

contract TestStorage {
    inner_opt: Inner?;

    init() {
        self.inner_opt = Inner{ foo: 123 };
    }
}