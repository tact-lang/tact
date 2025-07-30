struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: Int?;
    d: Bool?;
    s1: S1;
}

contract ManyStructComposed {
    s: S2;
    init() {
        self.s = S2{
            c: 5,
            d: false,
            s1: S1{ a: 1, b: true }
        };
    }
    receive() {
        let _ = self.s.c!! + self.s.s1.a;
    }
}