struct Foo { a: Int; }
struct Bar { b: Bool; }
struct Baz { c: String; }

contract SiblingStructs {
    foo: Foo;
    bar: Bar;
    baz: Baz;

    init() {
        self.foo = Foo{a: 1};
        self.bar = Bar{b: true};
        self.baz = Baz{c: "x"};
    }
}
