struct S {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{ a: 1, b: true, c: null, d: null };
    }

    receive() {
        if (self.s.c != null) {
            let tmp = self.s.c!!;
            dump(tmp);
        }
        if (self.s.d != null) {
            dump(1);
        }
    }
}