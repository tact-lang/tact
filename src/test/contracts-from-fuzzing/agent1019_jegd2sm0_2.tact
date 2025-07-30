struct Nested {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{foo: 5, bar: false};
    }
}