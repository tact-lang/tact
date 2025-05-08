struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Cell;
    f4: Slice;
    f5: String;
    f6: Address;
    f7: Int;
    f8: Bool;
    f9: Cell;
    f10: Slice;
}

contract TestContract {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            f1: 1,
            f2: true,
            f3: emptyCell(),
            f4: emptyCell().asSlice(),
            f5: "hi",
            f6: myAddress(),
            f7: 7,
            f8: false,
            f9: emptyCell(),
            f10: emptyCell().asSlice()
        };
    }
}