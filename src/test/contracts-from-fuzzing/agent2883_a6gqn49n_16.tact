struct WideStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: String;
    f6: Slice;
    f7: Bool;
    f8: Int;
    f9: String;
    f10: Address;
}

contract WideStructStorage {
    s: WideStruct;

    init() {
        self.s = WideStruct{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: emptyCell(),
            f5: "hi",
            f6: emptyCell().asSlice(),
            f7: false,
            f8: 8,
            f9: "more",
            f10: myAddress()
        };
    }
}