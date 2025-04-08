struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Bool?;
    f8: Int?;
    f9: Address?;
    f10: Cell?;
    f11: Slice?;
    f12: String?;
}

contract Test {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: "hello",
            f7: null,
            f8: 2,
            f9: null,
            f10: null,
            f11: null,
            f12: null,
        };
    }
}