struct Foo {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
}

contract Test {
    s: Foo;

    init() {
        self.s = Foo{ a:1, b:2, c:3, d:4, e:5, f:6, g:7 };
    }
}
