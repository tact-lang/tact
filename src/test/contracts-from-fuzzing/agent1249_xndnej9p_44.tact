struct Foo {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: Address?;
    f: String?;
}

contract OnlyStructOptionalFields {
    foo: Foo;

    init() {
        self.foo = Foo{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}