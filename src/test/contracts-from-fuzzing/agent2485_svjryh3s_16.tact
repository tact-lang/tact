struct S1 {
    a: Int?;
}

struct S2 {
    a: Int?;
    s1: S1?;
}

contract OptionalsInStructs {
    val: S2;

    init() {
        self.val = S2{ a: null, s1: null };
    }
}