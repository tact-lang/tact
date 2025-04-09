struct Foo {
    a: Int;
    b: Int?;
    c: String;
}

struct Bar {
    x: Bool;
    y: Foo;
    z: Foo?;
}

struct Baz {
    m: Bar;
    n: Bar?;
}

contract OptionalNest {
    data: Baz?;

    init() {
        self.data = null;
    }
}