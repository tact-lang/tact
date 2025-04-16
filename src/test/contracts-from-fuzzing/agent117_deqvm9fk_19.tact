struct S1 {
    a: Int;
}

struct S2 {
    b: Bool;
}

contract ManyNestedStructs {
    s1: S1;
    s2: S2;
    s1b: S1;
    s2b: S2;

    init() {
        self.s1 = S1{a: 1};
        self.s2 = S2{b: true};
        self.s1b = S1{a: 2};
        self.s2b = S2{b: false};
    }
}
