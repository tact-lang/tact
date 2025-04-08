struct Foo { a: Int; b: Bool }
struct Bar { c: String; d: Int }

contract MultiStructs {
    foo: Foo = Foo{ a: 1, b: true };
    bar: Bar = Bar{ c: "x", d: 5 };

    init() {
        self.foo = Foo{ a: 42, b: false };
        self.bar = Bar{ c: "y", d: 6 };
    }
}