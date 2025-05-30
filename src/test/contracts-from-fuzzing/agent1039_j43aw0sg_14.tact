struct S1 {
    val1: Int;
}

struct S2 {
    val2: Int;
}

struct Combined {
    s1: S1;
    s2: S2;
}

contract TestContract {
    combined: Combined;

    init() {
        self.combined = Combined{
            s1: S1{val1: 10},
            s2: S2{val2: 20}
        };
    }
}