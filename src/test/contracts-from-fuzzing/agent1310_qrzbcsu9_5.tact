struct LongStruct {
    a1: Int;
    a2: Int;
    a3: Bool;
    a4: Address;
    a5: Cell;
    a6: Slice;
    a7: String;
    a8: Int?;
    a9: Bool?;
    a10: Address?;
    a11: Cell?;
    a12: Slice?;
    a13: String?;
}

contract LongFields {
    data: LongStruct;
    init() {
        self.data = LongStruct{
            a1: 1,
            a2: 2,
            a3: true,
            a4: myAddress(),
            a5: emptyCell(),
            a6: emptyCell().asSlice(),
            a7: "a",
            a8: null,
            a9: null,
            a10: null,
            a11: null,
            a12: null,
            a13: null
        };
    }
}