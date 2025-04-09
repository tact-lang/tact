struct LongFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Int;
    f5: Bool;
    f6: Address;
    f7: String;
    f8: Cell;
    f9: Slice;
    f10: String;
}

contract TestContract {
    info: LongFields;
    init() {
        self.info = LongFields{
            f1: 1, f2: true, f3: myAddress(), f4: 4, f5: false, f6: myAddress(),
            f7: "a", f8: emptyCell(), f9: emptyCell().asSlice(), f10: "b"
        };
    }
}