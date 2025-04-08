struct S {
    a: Int;
    b: Int;
}

contract TestContract {
    s: S = S{a: pow(2,4), b: crc32("abc")};

    init() {
        self.s = S{a: 16, b: crc32("abc")};
    }

    receive() {
        let _ = self.s;
    }
}