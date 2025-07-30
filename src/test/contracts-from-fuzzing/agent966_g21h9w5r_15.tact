struct S1 {
    foo: Int;
}

struct S2 {
    bar: Bool;
}

contract TestContract {
    s1: S1;
    s2: S2?;

    init() {
        self.s1 = S1{ foo: 1 };
        self.s2 = null;
    }
}