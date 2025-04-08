struct Foo {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptAllFields {
    data: Foo;
    init() {
        self.data = Foo{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}