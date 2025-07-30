struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int;
    f4: Address;
    f5: Bool;
    f6: Int;
    f7: Address;
    f8: Bool;
    f9: Int;
    f10: Address;
    f11: Bool;
    f12: Int;
    f13: Address;
    f14: Bool;
    f15: Int;
    f16: Address;
    f17: Bool;
    f18: Int;
    f19: Address;
    f20: Bool;
}

contract LargeStructStorage {
    data: ManyFields;
    init() {
        self.data = ManyFields{
            f1: 1, f2: true, f3: 2, f4: myAddress(), f5: false,
            f6: 3, f7: myAddress(), f8: true, f9: 4, f10: myAddress(),
            f11: false, f12: 5, f13: myAddress(), f14: true, f15: 6,
            f16: myAddress(), f17: false, f18: 7, f19: myAddress(), f20: true
        };
    }
}