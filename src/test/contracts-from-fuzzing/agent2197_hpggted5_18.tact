struct Foo {
    a: Int;
}

struct Bar {
    b: Foo?;
}

struct Baz {
    c: Bar?;
}

contract OptChain {
    d: Baz?;

    init() {
        self.d = null;
    }
}