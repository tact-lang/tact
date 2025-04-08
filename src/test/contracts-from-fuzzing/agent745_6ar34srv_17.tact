struct Megastruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Cell;
    f6: Address;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Slice?;
    f11: Cell?;
    f12: Address?;
}

contract MegaStructContract {
    ms: Megastruct;
    init() {
        self.ms = Megastruct{
            f1: 1, f2: true, f3: "x", f4: emptyCell().asSlice(), f5: emptyCell(), f6: myAddress(),
            f7: null, f8: null, f9: null, f10: null, f11: null, f12: null
        };
    }
}