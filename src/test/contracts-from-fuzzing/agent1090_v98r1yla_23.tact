struct S1 {
    a: Int;
}

struct S2 {
    sa: S1;
    sb: S1;
}

contract NestedSameStructs {
    ss: S2;

    init() {
        self.ss = S2{
            sa: S1{ a: 1 },
            sb: S1{ a: 2 }
        };
    }
}