struct WideStruct {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: String?;
    f8: Bool?;
    f9: Int?;
    f10: Cell?;
    f11: Slice?;
    f12: Address?;
}

contract TestContract {
    wide: WideStruct;

    init() {
        self.wide = WideStruct{
            f1: 1,
            f2: "a",
            f3: true,
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: null,
            f8: null,
            f9: null,
            f10: null,
            f11: null,
            f12: null,
        };
    }
}