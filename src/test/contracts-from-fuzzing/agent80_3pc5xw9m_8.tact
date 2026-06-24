struct MaxFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: Address;
    f6: Cell;
    f7: Bool?;
    f8: String?;
    f9: Address?;
    f10: Cell?;
    f11: Int?;
    f12: Bool;
    f13: String;
    f14: Address;
    f15: Cell;
    f16: Int;
}

contract ManyFieldsStorage {
    data: MaxFields;
    init() {
        self.data = MaxFields{
            f1: 1,
            f2: 2,
            f3: false,
            f4: "a",
            f5: myAddress(),
            f6: emptyCell(),
            f7: null,
            f8: "b",
            f9: null,
            f10: null,
            f11: 11,
            f12: true,
            f13: "c",
            f14: myAddress(),
            f15: emptyCell(),
            f16: 16
        };
    }
}