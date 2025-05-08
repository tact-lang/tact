struct WideStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Address;
    f6: Bool;
    f7: Int;
    f8: Address;
    f9: String;
    f10: Bool;
    f11: Int;
    f12: Cell;
}

contract WideStorage {
    big: WideStruct;

    init() {
        self.big = WideStruct{
            f1: 1,
            f2: true,
            f3: "a",
            f4: emptyCell(),
            f5: myAddress(),
            f6: false,
            f7: 2,
            f8: myAddress(),
            f9: "b",
            f10: true,
            f11: 3,
            f12: emptyCell(),
        };
    }
}