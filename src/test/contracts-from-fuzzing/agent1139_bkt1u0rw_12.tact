struct Wide {
    f1: Int; f2: Int; f3: Int;
    f4: Bool; f5: Bool; f6: Bool;
    f7: Address; f8: Address; f9: Address;
    f10: Cell; f11: Cell; f12: Cell;
}

contract PersistWide {
    val: Wide;
    init() {
        self.val = Wide{
            f1: 1, f2: 2, f3: 3,
            f4: true, f5: false, f6: true,
            f7: myAddress(), f8: myAddress(), f9: myAddress(),
            f10: emptyCell(), f11: emptyCell(), f12: emptyCell(),
        };
    }
}