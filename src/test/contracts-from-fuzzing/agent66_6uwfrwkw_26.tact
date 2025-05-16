struct Foo {
    a: Int;
    b: Int;
}

struct Bar {
    c: Int;
    foo: Foo;
    d: Int;
}

contract EmbedInMiddle {
    val: Bar;

    init() {
        self.val = Bar{
            c:1, foo: Foo{a:10,b:20}, d:3
        };
    }
}