struct S1 {
    a: Int;
}

struct S2 {
    s1_1: S1;
    s1_2: S1;
}

contract TwoNestedSameType {
    val: S2;

    init() {
        self.val = S2{
            s1_1: S1{ a: 11 },
            s1_2: S1{ a: 22 }
        };
    }
}