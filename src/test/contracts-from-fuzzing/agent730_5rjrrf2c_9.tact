struct FlatStruct {
    x1: Int;
    x2: Bool;
    x3: Address;
    x4: Cell;
    x5: Slice;
    x6: String;
    x7: Int?;
    x8: Bool?;
    x9: Address?;
    x10: Cell?;
    x11: Slice?;
    x12: String?;
}

contract FlatStorage {
    s: FlatStruct;

    init() {
        self.s = FlatStruct{
            x1: 1,
            x2: true,
            x3: myAddress(),
            x4: emptyCell(),
            x5: emptyCell().asSlice(),
            x6: "hi",
            x7: 7,
            x8: false,
            x9: null,
            x10: null,
            x11: null,
            x12: null,
        };
    }
}