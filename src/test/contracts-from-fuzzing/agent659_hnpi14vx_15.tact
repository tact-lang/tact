struct Foo {
    x: Int;
    y: Bool?;
}

contract TestContract {
    a: Int?;
    b: Foo?;
    c: Bool?;
    d: Foo;
    e: String?;
    f: Int;

    init() {
        self.a = null;
        self.b = null;
        self.c = true;
        self.d = Foo{ x: 1, y: null };
        self.e = null;
        self.f = 42;
    }
}