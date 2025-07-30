struct S {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
}

contract Test {
    s: S;

    init() {
        self.s = S{
            f1: 1,
            f2: true,
            f3: "hi",
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: beginCell()
        };
    }
}