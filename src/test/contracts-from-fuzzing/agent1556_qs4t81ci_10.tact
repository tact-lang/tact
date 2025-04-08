// fields with serialization hints
struct Foo {
    a: Int as int4 = 4;
    b: Int as uint8 = 8;
    c: Int as int64 = 64;
    d: Int as uint256 = 256;
}

contract TestContract {
    s: Foo = Foo{};

    init() {
        self.s = Foo{a: 3, b: 7, c: 33, d: 123456};
    }

    receive() {
        let _ = self.s.a + self.s.b + self.s.c + self.s.d;
    }
}