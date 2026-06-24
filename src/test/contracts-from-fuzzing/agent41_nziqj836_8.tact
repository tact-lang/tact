struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Cell;
    f6: Address?;
    f7: String;
    f8: Bool;
    f9: Int;
    f10: String;
}

contract TestContract {
    store: LongStruct;

    init() {
        self.store = LongStruct{
            f1: 1,
            f2: false,
            f3: "a",
            f4: emptyCell().asSlice(),
            f5: emptyCell(),
            f6: null,
            f7: "b",
            f8: true,
            f9: 123,
            f10: "z",
        };
    }

    receive() {
        self.store;
    }
}