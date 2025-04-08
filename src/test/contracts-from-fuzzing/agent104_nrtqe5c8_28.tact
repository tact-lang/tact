struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1_1: S1;
    s1_2: S1;
}

contract DuplicateStructRefs {
    val: S2;
    init() {
        self.val = S2{
            s1_1: S1{ a: 1, b: true },
            s1_2: S1{ a: 2, b: false }
        };
    }
}