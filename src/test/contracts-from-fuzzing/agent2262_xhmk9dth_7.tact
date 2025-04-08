struct Bar {
    foo: Int;
    baz: String?;
}

struct Foo {
    a: Bool;
    b: Bar?;
}

contract Test {
    s: Foo;

    init() {
        self.s = Foo{
            a: true,
            b: null,
        };
    }
}