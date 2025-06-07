struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: Int;
    f6: String;
    f7: Bool;
    f8: Int;
    f9: Bool?;
    f10: String;
    f11: Int;
    f12: Bool;
    f13: String;
    f14: Bool?;
    f15: Int;
}

contract TestContract {
    data: ManyFields;
    
    init() {
        self.data = ManyFields{
            f1: 1, f2: true, f3: "x", f4: null, f5: 5, f6: "y",
            f7: false, f8: 8, f9: true, f10: "z", f11: 11, f12: true,
            f13: "w", f14: false, f15: 15
        };
    }
}