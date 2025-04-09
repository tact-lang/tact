struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: Int;
    f9: Bool;
    f10: String;
    f11: Address;
    f12: Cell;
}

contract ManyStructFieldVar {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            f1: 1, f2: false, f3: "a", f4: myAddress(),
            f5: emptyCell(), f6: emptyCell().asSlice(), f7: beginCell(),
            f8: 2, f9: true, f10: "b", f11: myAddress(), f12: emptyCell()
        };
    }
}