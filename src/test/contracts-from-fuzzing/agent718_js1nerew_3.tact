struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Int?;
    f6: Bool?;
    f7: Slice;
    f8: Address;
    f9: String;
    f10: Int;
    f11: Bool;
    f12: String;
    f13: Cell;
    f14: Int?;
    f15: Bool?;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1, f2: true, f3: "hi", f4: emptyCell(), f5: null, f6: false,
            f7: emptyCell().asSlice(), f8: myAddress(), f9: "bye", f10: 10,
            f11: false, f12: "ok", f13: emptyCell(), f14: 42, f15: null
        };
    }
}