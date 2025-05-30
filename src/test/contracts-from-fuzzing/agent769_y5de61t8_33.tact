contract NestedState {
    foo: Int;
    bar: Int;
    nest: Nested;

    init() {
        self.foo = 1;
        self.bar = 2;
        self.nest = Nested {
            baz: 3
        };
    }
}

struct Nested {
    baz: Int;
}