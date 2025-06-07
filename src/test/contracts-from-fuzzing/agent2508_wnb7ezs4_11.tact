struct MassiveOptionalStruct {
    f1: Int?; f2: Int?; f3: Int?; f4: Int?; f5: Int?;
    f6: Int?; f7: Int?; f8: Int?; f9: Int?; f10: Int?;
    f11: Bool?; f12: Bool?; f13: Bool?; f14: Bool?; f15: Bool?;
    f16: String?; f17: String?; f18: String?; f19: String?; f20: String?;
}

contract OptionalMass {
    os: MassiveOptionalStruct;

    init() {
        self.os = MassiveOptionalStruct{
            f1: null, f2: 1, f3: 2, f4: null, f5: 5,
            f6: 6, f7: null, f8: 8, f9: null, f10: 10,
            f11: true, f12: null, f13: false, f14: null, f15: true,
            f16: null, f17: "hi", f18: null, f19: "there", f20: null
        };
    }
}
