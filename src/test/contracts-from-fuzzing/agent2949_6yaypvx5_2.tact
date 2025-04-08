struct Nested {
    inner: Int;
}

contract UsesNested {
    param: Nested;

    init() {
        self.param = Nested{ inner: 42 };
    }
}
