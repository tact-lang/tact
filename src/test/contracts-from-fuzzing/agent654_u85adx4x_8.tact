struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

contract TestContract {
    s1: S1;
    s2: S2;
    c: Int;
    d: Bool;
    e: String;

    init() {
        self.s1 = S1{a: 1};
        self.s2 = S2{b: 2};
        self.c = 3;
        self.d = true;
        self.e = "abc";
    }
}