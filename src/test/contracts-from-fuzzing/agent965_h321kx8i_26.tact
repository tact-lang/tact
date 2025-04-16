// struct with lots of optionals
struct ManyOpts {
    f1: Int?; f2: Int?; f3: Int?; f4: Int?; f5: Int?;
    f6: Bool?; f7: Bool?; f8: Bool?; f9: Bool?; f10: Bool?;
    f11: String?; f12: String?; f13: String?; f14: String?; f15: String?;
}

contract OptHeavy {
    val: ManyOpts;

    init() {
        self.val = ManyOpts{
            f1:null, f2:null, f3:null, f4:null, f5:null,
            f6:null, f7:null, f8:null, f9:null, f10:null,
            f11:null, f12:null, f13:null, f14:null, f15:null,
        };
    }
}