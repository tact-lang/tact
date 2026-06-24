struct SRem1 {
    a: Int;
    s: Slice as remaining;
}

struct SRem2 {
    b: Int;
    s: Slice as remaining;
}

contract MultipleRemainingFields {
    s1: SRem1;
    s2: SRem2;

    init() {
        self.s1 = SRem1{ a:1, s: emptyCell().asSlice() };
        self.s2 = SRem2{ b:2, s: emptyCell().asSlice() };
    }
}