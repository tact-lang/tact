struct SimpleNested {
    inner: Int;
}

contract OverwriteDefault {
    foo: SimpleNested = SimpleNested{ inner: 5 };

    init() {
        self.foo = SimpleNested{ inner: 99 };
    }
}
