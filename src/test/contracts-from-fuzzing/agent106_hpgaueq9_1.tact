struct Nested { a: Int; b: Bool; c: Int?; }

contract TestContract {
    foo: Int = 1;
    bar: Bool = true;
    baz: Int?; // optional without default, defaults to null implicitly
    nested: Nested = Nested{ a: 10, b: false, c: null };

    init() {
        self.foo = 42;
        self.bar = false;
        self.baz = 100;
        self.nested = Nested{ a: 5, b: true, c: 77 };
    }

    receive() {}
}