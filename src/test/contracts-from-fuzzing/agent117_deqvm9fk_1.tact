struct Nested {
    field1: Int;
    field2: Bool;
}

contract TestContract {
    foo: Int;
    bar: Bool;
    baz: Nested;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = Nested{field1: 42, field2: false};
    }
}
