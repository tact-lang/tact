struct Foo { a: Int; }
struct Bar { b: Bool; }

contract MultiStructVars {
    foo: Foo;
    bar: Bar;

    init() {
        self.foo = Foo{ a: 5 };
        self.bar = Bar{ b: true };
    }
}