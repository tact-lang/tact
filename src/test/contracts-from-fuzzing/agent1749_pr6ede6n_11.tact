struct LongStruct {
    f0: Int;
    f1: Bool;
    f2: Address;
    f3: Cell;
    f4: String;
    f5: Int?;
    f6: Bool?;
    f7: Address?;
    f8: Cell?;
    f9: String?;
}

contract StructBigField {
    s: LongStruct;
    init() {
        self.s = LongStruct{
            f0: 1,
            f1: true,
            f2: myAddress(),
            f3: emptyCell(),
            f4: "hi",
            f5: null,
            f6: null,
            f7: null,
            f8: null,
            f9: null
        };
    }
}