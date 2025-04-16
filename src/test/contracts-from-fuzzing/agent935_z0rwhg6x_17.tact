struct S1 {
    a: Int;
    b: Int;
}

struct S2 {
    s1: S1;
    c: Int;
}

contract TestContract {
    value1: S1;
    value2: S2;

    init() {
        self.value1 = S1{ a: 1, b: 2 };
        self.value2 = S2{ s1: S1{ a: 3, b: 4 }, c: 5 };
    }
}