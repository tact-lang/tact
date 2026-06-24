struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int?;
    f6: String?;
    f7: Bool?;
    f8: Address?;
    f9: Cell;
    f10: Slice;
    f11: Builder;
    f12: Int;
    f13: Bool;
    f14: String;
    f15: Address;
    f16: Int?;
    f17: String?;
    f18: Bool?;
    f19: Address?;
    f20: Cell;
}

contract TestContract {
    storage: ManyFields;
    
    init() {
        self.storage = ManyFields{
            f1: 1,
            f2: true,
            f3: "hi",
            f4: myAddress(),
            f5: null,
            f6: null,
            f7: null,
            f8: null,
            f9: emptyCell(),
            f10: emptyCell().asSlice(),
            f11: beginCell(),
            f12: 12,
            f13: false,
            f14: "bye",
            f15: myAddress(),
            f16: null,
            f17: null,
            f18: null,
            f19: null,
            f20: emptyCell(),
        };
    }
}