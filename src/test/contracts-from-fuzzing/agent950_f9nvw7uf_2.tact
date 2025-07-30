struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: String;
    f8: String;
    f9: Cell;
    f10: Slice;
    f11: Bool?;
    f12: Int?;
    f13: String?;
    f14: Cell?;
}

contract TestFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1, f2: 2, f3: 3,
            f4: true, f5: false, f6: true,
            f7: "a", f8: "b",
            f9: emptyCell(), f10: emptyCell().asSlice(),
            f11: null, f12: null, f13: null, f14: null
        };
    }
}