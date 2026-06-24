struct BigStruct {
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Int?;
    a5: String?;
    a6: Cell;
    a7: Slice;
    a8: Builder;
    a9: Address;
    a10: Bool?;
    a11: Int;
    a12: Bool;
    a13: String;
    a14: Int?;
    a15: String?;
    a16: Cell;
    a17: Slice;
    a18: Builder;
    a19: Address;
    a20: Bool?;
}

contract BigStructStorage {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a1: 1,
            a2: false,
            a3: "hi",
            a4: null,
            a5: null,
            a6: emptyCell(),
            a7: emptyCell().asSlice(),
            a8: beginCell(),
            a9: myAddress(),
            a10: true,
            a11: 11,
            a12: true,
            a13: "bye",
            a14: 14,
            a15: "abc",
            a16: emptyCell(),
            a17: emptyCell().asSlice(),
            a18: beginCell(),
            a19: myAddress(),
            a20: false,
        };
    }
}