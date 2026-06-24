struct Baz {
    p: Int?;
    q: Bool?;
}

struct Bar {
    x: Int?;
    y: Baz?;
}

struct Foo {
    a: Int;
    b: Bar?;
}

contract Test {
    val: Foo?;

    init() {
        self.val = Foo {
            a: 7,
            b: Bar{
                x: null,
                y: Baz{ p: 42, q: null }
            }
        };
    }
}