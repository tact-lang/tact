contract ManyOptionals {
    foo: Foo;

    init() {
        self.foo = Foo{
            a: null,
            b: myAddress(),
            c: null,
            d: "hi",
            e: null,
            f: myAddress(),
            g: null,
            h: "there",
            i: null,
            j: myAddress()
        };
    }
}

struct Foo {
    a: Address?;
    b: Address?;
    c: String?;
    d: String?;
    e: Address?;
    f: Address?;
    g: String?;
    h: String?;
    i: Address?;
    j: Address?;
}
