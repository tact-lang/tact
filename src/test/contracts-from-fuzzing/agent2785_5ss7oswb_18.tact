struct Foo {
    a: Int as int4; // small serialization
    b: Int as uint12;
    c: Int as int20;
}

contract SmallInts {
    f: Foo;

    init() {
        self.f = Foo{a: 3, b: 50, c: -20};
    }

    receive() {
        let _ = self.f.a + self.f.b + self.f.c;
    }
}
