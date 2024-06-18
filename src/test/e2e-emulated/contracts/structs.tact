struct S {
    a: Bool;
    b: Int;
}

struct T {
    a: Int;
    s: S;
}

contract StructsTester {
    s1: S = S {a: false, b: 21 + 21};
    s2: S;
    t1: T = T {a: 43, s: S {a: true, b: 44}};
    t2: T;

    init() {
        self.s2 = S {a: false || false, b: 42};
        self.t2 = T {a: 40 + 3, s: S {a: true && true, b: 44 | 4}};
    }

    // Deploy
    receive() { }

    get fun structInitializerTest(): Bool {
        return self.s1.a == self.s2.a && self.s1.b == self.s2.b &&
               self.t1.a == self.t2.a &&
               self.t1.s.a == self.t2.s.a && self.t1.s.b == self.t2.s.b;
    }
}
