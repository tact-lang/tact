struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Address;
    f11: Cell;
    f12: Slice;
}

contract LongStructTest {
    s: LongStruct;

    init() {
        self.s = LongStruct{
            f1: 1,
            f2: true,
            f3: "3",
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: null,
            f8: false,
            f9: null,
            f10: myAddress(),
            f11: emptyCell(),
            f12: emptyCell().asSlice()
        };
    }
}