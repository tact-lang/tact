struct Foo {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
}

contract SerializedFields {
    s: Foo;
    init() {
        self.s = Foo{ a: 1, b: -42, c: ton("1") };
    }
    receive() {
        let _ = self.s.a + self.s.b + self.s.c;
    }
}