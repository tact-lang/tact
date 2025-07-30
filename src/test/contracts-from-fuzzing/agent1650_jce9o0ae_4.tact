struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: Int;
    d: Bool;
    e: S1;
}

contract ManyFields {
    f1: S1;
    f2: S2;

    init() {
        self.f1 = S1{a: 1, b: true};
        self.f2 = S2{c: 2, d: false, e: self.f1};
    }
}