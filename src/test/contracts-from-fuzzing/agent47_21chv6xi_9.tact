struct Huge {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Bool;
    f7: Bool;
    f8: Bool;
    f9: Bool;
    f10: Bool;
    f11: String;
    f12: String;
    f13: String;
    f14: String;
    f15: Int?;
    f16: Bool?;
    f17: String?;
    f18: Int;
    f19: Bool;
    f20: String;
}

contract HugeStruct {
    data: Huge;

    init() {
        self.data = Huge{
            f1:1,f2:2,f3:3,f4:4,f5:5,
            f6:true,f7:false,f8:true,f9:false,f10:true,
            f11:"s1",f12:"s2",f13:"s3",f14:"s4",
            f15:null,f16:null,f17:null,
            f18:18,f19:true,f20:"done"
        };
    }
}