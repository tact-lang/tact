struct Foo {
    x: Int;
    y: Bool?;
}

contract TestContract {
    a: Foo?;
    b: Int?;
    c: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}