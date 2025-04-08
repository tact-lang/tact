struct S1 {
    a: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
    s1c: S1;
}

contract TestContract {
    data: S2;

    init() {
        self.data = S2{
            s1a: S1{ a: 1 },
            s1b: S1{ a: 2 },
            s1c: S1{ a: 3 },
        };
    }
}