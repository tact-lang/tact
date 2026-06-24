struct Foo {
    a: Int? = null;
    b: String?;
    c: Bool? = true;
}

struct Bar {
    foo: Foo;
    note: String;
}

contract C {
    bar: Bar;

    init() {
        self.bar = Bar{ foo: Foo{ a: null, b: null, c: false }, note: "hi" };
    }
}