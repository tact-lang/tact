struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Cell;
    f6: Slice;
    f7: Int?;
    f8: Bool?;
    f9: Address?;
    f10: String?;
    f11: Cell?;
    f12: Slice?;
}

contract LongStructContract {
    data: LongStruct;
    init() {
        self.data = LongStruct{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: "hello",
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: null,
            f8: null,
            f9: null,
            f10: null,
            f11: null,
            f12: null,
        };
    }
}