struct S1 {
    n: Int;
}

struct S2 {
    s1a: S1;
    s1b: S1;
    s1c: S1;
    s1d: S1;
    s1e: S1;
}

contract NestedMultipleStructs {
    val: S2;
    init() {
        self.val = S2{
            s1a: S1{ n: 1 },
            s1b: S1{ n: 2 },
            s1c: S1{ n: 3 },
            s1d: S1{ n: 4 },
            s1e: S1{ n: 5 },
        };
    }
}