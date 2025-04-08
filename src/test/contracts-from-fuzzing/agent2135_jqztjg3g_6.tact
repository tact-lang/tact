struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: Cell;
    f7: Slice;
    f8: Address;
    f9: Int;
    f10: Bool;
}

contract LongStructField {
    s: LongStruct;

    init() {
        self.s = LongStruct{
            f1: 1, f2: true, f3: null, f4: false, f5: "x",
            f6: emptyCell(), f7: emptyCell().asSlice(), f8: myAddress(),
            f9: -99, f10: true
        };
    }
}