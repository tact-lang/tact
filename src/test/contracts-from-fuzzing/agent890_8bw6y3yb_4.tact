struct S1 {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Address;
    f8: Cell;
    f9: Slice;
    f10: Builder;
}

contract TestContract {
    state: S1;

    init() {
        self.state = S1{
            f1: 1,
            f2: true,
            f3: "a",
            f4: null,
            f5: null,
            f6: null,
            f7: myAddress(),
            f8: emptyCell(),
            f9: emptyCell().asSlice(),
            f10: beginCell()
        };
    }
}