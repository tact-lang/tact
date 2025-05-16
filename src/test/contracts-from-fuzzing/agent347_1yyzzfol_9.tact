struct ManyOpts {
    f1: Int?; f2: Int?; f3: Int?; f4: Int?; f5: Int?;
    f6: Bool?; f7: Bool?; f8: Bool?; f9: Bool?; f10: Bool?;
    f11: String?; f12: String?; f13: String?; f14: String?; f15: String?;
    f16: Int?; f17: Bool?; f18: String?; f19: Bool?; f20: Int?;
}

contract ManyOptionals {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            f1: 1, f2: 2, f3: 3, f4: null, f5: null,
            f6: true, f7: null, f8: false, f9: null, f10: true,
            f11: "a", f12: null, f13: "b", f14: null, f15: "c",
            f16: null, f17: false, f18: null, f19: null, f20: 42
        };
    }
}