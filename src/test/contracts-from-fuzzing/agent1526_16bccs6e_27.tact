struct S1 { x: Int; }
struct S2 { y: Int; }

contract MultiStructFields {
    s1: S1?;
    s2: S2;

    init() {
        self.s1 = null;
        self.s2 = S2{ y: 99 };
    }
}