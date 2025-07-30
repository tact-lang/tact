struct S1 {
    a: Int;
    b: String;
}

struct S2 {
    c: Int;
    d: Bool;
}

contract ManyStructs {
    s1: S1;
    s2: S2;

    init() {
        self.s1 = S1{ a:1, b:"hi" };
        self.s2 = S2{ c:2, d:true };
    }
}