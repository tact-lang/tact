struct S1 { a: Int; }
struct S2 { b: Int; }

contract SwapStructs {
    s2: S2;
    s1: S1;

    init() {
        self.s2 = S2{ b: 3 };
        self.s1 = S1{ a: 4 };
    }
}