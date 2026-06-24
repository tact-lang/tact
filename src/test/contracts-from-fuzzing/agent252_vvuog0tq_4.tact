struct BigOne {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Bool;
    f5: Address;
    f6: String;
    f7: Cell;
    f8: Slice;
    f9: Builder;
}

contract TestContract {
    big: BigOne;

    init() {
        self.big = BigOne {
            f1: 1,
            f2: 2,
            f3: 3,
            f4: true,
            f5: myAddress(),
            f6: "test",
            f7: emptyCell(),
            f8: emptyCell().asSlice(),
            f9: beginCell()
        };
    }
}