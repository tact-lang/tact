struct Foo {
    a: Int;
    b: Int?;
    c: Bool = false;
    d: String?;
}

contract Test {
    optFoo: Foo?;
    init() {
        self.optFoo = Foo{ a: 77 };
    }
}