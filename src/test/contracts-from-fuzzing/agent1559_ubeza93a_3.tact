struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
    f7: String;
    f8: Bool;
    f9: Int;
    f10: Bool;
}

contract BigStructTest {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: false,
            f3: "x",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: myAddress(),
            f7: "y",
            f8: true,
            f9: 42,
            f10: false,
        };
    }
}