struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: Int?;
    f9: Bool?;
    f10: String;
    f11: String?;
    f12: Cell?;
    f13: Slice?;
    f14: Address?;
    f15: Int;
}

contract LongStructStorage {
    data: LongStruct;
    
    init() {
        self.data = LongStruct{
            f1: 0,
            f2: true,
            f3: myAddress(),
            f4: "hello",
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: beginCell(),
            f8: null,
            f9: null,
            f10: "bye",
            f11: null,
            f12: null,
            f13: null,
            f14: null,
            f15: 42
        };
    }
}