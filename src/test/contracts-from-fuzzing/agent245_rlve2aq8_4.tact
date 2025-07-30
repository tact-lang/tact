struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Cell;
    f4: Bool;
    f5: Slice;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: Int;
    f10: String;
}

contract BigFieldsTest {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: true,
            f3: emptyCell(),
            f4: false,
            f5: emptyCell().asSlice(),
            f6: "abc",
            f7: 7,
            f8: true,
            f9: 42,
            f10: "xyz"
        };
    }
}