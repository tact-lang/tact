struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String?;
    f5: Slice;
    f6: Bool;
    f7: String;
    f8: Cell;
    f9: Int?;
    f10: Address?;
    f11: Cell;
}

contract StructHolder {
    s: LongStruct;

    init() {
        self.s = LongStruct{
            f1: 1,
            f2: false,
            f3: myAddress(),
            f4: "optional",
            f5: emptyCell().asSlice(),
            f6: true,
            f7: "string",
            f8: emptyCell(),
            f9: 777,
            f10: myAddress(),
            f11: emptyCell(),
        };
    }
}