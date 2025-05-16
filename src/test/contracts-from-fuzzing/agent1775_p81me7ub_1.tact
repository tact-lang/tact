struct Nested {
    x: Int = 10;
    y: Bool = false;
}

contract TestNested {
    inner: Nested;

    init() {
        self.inner = Nested{x: 42, y: true};
    }
}