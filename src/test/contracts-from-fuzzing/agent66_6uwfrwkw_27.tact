struct Foo {
    a: Int?;
    b: Int?;
}

struct Bar {
    c: Int?;
    foo: Foo?;
    d: Int?;
}

contract EmbedOptInMiddle {
    val: Bar;

    init() {
        self.val = Bar{
            c:null, foo:null, d:null
        };
    }
}