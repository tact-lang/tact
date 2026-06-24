struct SFull {
    a: Int;
    b: Bool;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice;
}

contract TestContract {
    s1: SFull;
    s2: SFull;

    init() {
        self.s1 = SFull{ a: 1, b: true, c: null, d: null, e: null, f: emptyCell().asSlice() };
        self.s2 = SFull{ a: 2, b: false, c: "hi", d: myAddress(), e: emptyCell(), f: emptyCell().asSlice() };
    }
}