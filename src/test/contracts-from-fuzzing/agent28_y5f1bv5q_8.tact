struct S {
    f1: Int = 1;
    f2: Bool = true;
    f3: String = "x";
    f4: Slice;
}

contract Test {
    s: S;

    init() {
        self.s = S{
            f1: 42,
            f2: false,
            f3: "changed",
            f4: emptyCell().asSlice()
        };
    }
}