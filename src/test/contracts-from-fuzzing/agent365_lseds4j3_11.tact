struct S1 {
    flag: Bool;
}
struct S2 {
    number: Int;
}

contract MultiStructs {
    s1: S1;
    s2: S2;

    init() {
        self.s1 = S1{ flag: true };
        self.s2 = S2{ number: 999 };
    }
}