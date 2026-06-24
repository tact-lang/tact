struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Cell;
    f6: Int?;
    f7: Bool?;
    f8: String?;
    f9: Slice?;
    f10: Cell?;
    f11: Int as uint32;
    f12: Int as int64;
    f13: Bool;
    f14: String;
    f15: Slice;
    f16: Cell;
}

contract TestContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: true,
            f3: "hi",
            f4: emptyCell().asSlice(),
            f5: emptyCell(),
            f6: 2,
            f7: false,
            f8: "optional",
            f9: emptyCell().asSlice(),
            f10: emptyCell(),
            f11: 123,
            f12: 456,
            f13: true,
            f14: "str",
            f15: emptyCell().asSlice(),
            f16: emptyCell()
        };
    }
}