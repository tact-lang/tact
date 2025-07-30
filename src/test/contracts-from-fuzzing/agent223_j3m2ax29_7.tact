struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Int;
    f6: Bool;
    f7: Int?;
    f8: Bool?;
    f9: Int;
    f10: Bool;
    f11: Int?;
    f12: Bool?;
    f13: Int;
    f14: Bool;
    f15: Int?;
    f16: Bool?;
    f17: Int;
    f18: Bool;
    f19: Int?;
    f20: Bool?;
}

contract LongStructFieldTest {
    st: LongStruct;

    init() {
        self.st = LongStruct{
            f1:1, f2:true, f3:null, f4:false, f5:2, f6:true,
            f7:null, f8:true, f9:3, f10:false, f11:null, f12:true,
            f13:4, f14:true, f15:null, f16:false, f17:5, f18:false,
            f19:null, f20:true
        };
    }
}