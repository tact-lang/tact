struct Nested {
    foo: Int = 11;
    bar: Bool;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{bar: true};
    }
}