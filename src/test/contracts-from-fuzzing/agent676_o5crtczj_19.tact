struct Foo {
    a: Int;
    b: String;
    c: Bool;
}

struct Bar {
    foo: Foo;
    opt: Bool?;
}

struct Baz {
    bar: Bar?;
    x: Int;
    y: Bool;
}

contract TestContract {
    nested: Baz;
    init() {
        self.nested = Baz{bar: null, x: 3, y: true};
    }
}