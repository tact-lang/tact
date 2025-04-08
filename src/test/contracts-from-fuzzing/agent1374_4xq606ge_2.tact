struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Address;
    f6: Int;
    f7: Bool;
    f8: String;
    f9: Slice;
    f10: Address;
}

contract TestContract {
    stored: BigStruct;

    init() {
        self.stored = BigStruct{
            f1: 1,
            f2: false,
            f3: "a",
            f4: emptyCell().asSlice(),
            f5: myAddress(),
            f6: 2,
            f7: true,
            f8: "b",
            f9: emptyCell().asSlice(),
            f10: myAddress(),
        };
    }
}