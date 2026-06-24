struct S {
    a: Int;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as int1;
    e: Int as int64;
}

contract SerContract {
    s: S;

    init() {
        self.s = S{ a:1, b:2, c:3, d:0, e:5 };
    }

    receive() {
        self.s = self.s;
    }
}