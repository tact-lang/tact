struct LargeStruct {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool;
    f5: String;
    f6: String;
    f7: Address;
    f8: Address;
    f9: Cell;
    f10: Cell;
    f11: Slice;
    f12: Slice;
}

contract LargeStorage {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: 2,
            f3: true,
            f4: false,
            f5: "test1",
            f6: "test2",
            f7: myAddress(),
            f8: myAddress(),
            f9: emptyCell(),
            f10: emptyCell(),
            f11: emptyCell().asSlice(),
            f12: emptyCell().asSlice()
        };
    }
}