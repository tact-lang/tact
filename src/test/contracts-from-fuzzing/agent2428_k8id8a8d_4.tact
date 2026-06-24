struct S1 {
    f1: Int;
    f2: Bool;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

contract TestContract {
    data: S2;

    init() {
        self.data = S2 {
            s1a: S1{ f1: 1, f2: false },
            s1b: S1{ f1: 2, f2: true }
        };
    }
}