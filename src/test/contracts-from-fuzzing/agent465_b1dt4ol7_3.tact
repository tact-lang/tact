struct BigFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool?;
    f5: String;
    f6: Address;
    f7: Cell;
    f8: Slice;
    f9: Builder;
    f10: Int;
}

contract TestContract {
    data: BigFields;

    init() {
        self.data = BigFields{
            f1: 1,
            f2: 2,
            f3: false,
            f4: null,
            f5: "hello",
            f6: myAddress(),
            f7: emptyCell(),
            f8: emptyCell().asSlice(),
            f9: beginCell(),
            f10: 10,
        };
    }
}
