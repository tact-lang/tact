struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Cell?;
    f11: Slice?;
    f12: Builder?;
}

contract FieldMax {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: "s",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: beginCell(),
            f7: null,
            f8: null,
            f9: null,
            f10: null,
            f11: null,
            f12: null,
        };
    }
}