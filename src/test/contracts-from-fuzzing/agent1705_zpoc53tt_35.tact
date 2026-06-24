message M1 {}
message M2 {}
message M3 {}

struct S {
    m1: M1;
    m2: M2;
    m3: M3;
}

contract C {
    s: S;

    init() {
        self.s = S{
            m1: M1{},
            m2: M2{},
            m3: M3{},
        };
    }
}