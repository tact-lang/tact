struct S1 {
    val: Int?;
}

struct S2 {
    s: S1?;
}

contract OptOptStruct {
    s2: S2;
    init() {
        self.s2 = S2{ s: null };
    }
}
