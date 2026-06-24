struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Address;
    f6: Slice;
    f7: String;
    f8: Int;
    f9: Bool;
    f10: String;
}

contract LargeStructContract {
    s: LargeStruct;
    init() {
        self.s = LargeStruct{
            f1: 1,
            f2: false,
            f3: null,
            f4: true,
            f5: myAddress(),
            f6: emptyCell().asSlice(),
            f7: "hi",
            f8: 2,
            f9: true,
            f10: "bye",
        };
    }
}