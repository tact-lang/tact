struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Bool;
    f12: String;
    f13: Bool?;
    f14: String?;
    f15: Int;
    f16: Int;
    f17: Bool;
    f18: String;
    f19: Bool?;
    f20: String?;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1, f2: 2, f3: 3, f4: 4, f5: 5, f6: 6, f7: 7, f8: 8, f9: 9, f10: 10,
            f11: false, f12: "abc", f13: null, f14: null, f15: 11, f16: 12,
            f17: true, f18: "def", f19: true, f20: "ghi",
        };
    }
}