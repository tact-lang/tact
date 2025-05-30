struct S1 {
    a: Int?;
    b: Bool?;
}

struct S2 {
    s1opt: S1?;
}

contract OptStructInOptStruct {
    s2: S2;

    init() {
        self.s2 = S2{ s1opt: null };
    }
}