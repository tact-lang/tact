struct S1 {
    a: Int;
    b: Bool?;
}

struct S2 {
    s1a: S1;
    s1b: S1?;
    s1c: S1;
}

contract OptionalCombos {
    s2: S2;

    init() {
        self.s2 = S2{
            s1a: S1{a: 1, b: null},
            s1b: null,
            s1c: S1{a: 3, b: true},
        };
    }
}