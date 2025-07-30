struct LeftNested {
    a: Int;
}

struct RightNested {
    b: Bool;
}

contract DoubleNested {
    ln: LeftNested;
    rn: RightNested;
    init() {
        self.ln = LeftNested{ a: 5 };
        self.rn = RightNested{ b: true };
    }
}