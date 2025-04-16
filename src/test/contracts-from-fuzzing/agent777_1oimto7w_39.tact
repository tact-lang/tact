struct ManyOptFields {
    f1: Int?;
    f2: Int?;
    f3: Bool?;
    f4: String?;
    f5: Int?;
    f6: String?;
    f7: Bool?;
    f8: Int?;
    f9: String?;
    f10: Int?;
    f11: String?;
    f12: Int?;
    f13: Bool?;
    f14: String?;
    f15: Int?;
    f16: String?;
    f17: Bool?;
    f18: Int?;
    f19: String?;
    f20: Int?;
}

contract ManyOptionalsTest {
    field: ManyOptFields;

    init() {
        self.field = ManyOptFields{
            f1:null,f2:null,f3:true,f4:null,f5:null,
            f6:null,f7:null,f8:null,f9:null,f10:null,
            f11:null,f12:null,f13:null,f14:null,f15:null,
            f16:null,f17:null,f18:null,f19:null,f20:null,
        };
    }
}