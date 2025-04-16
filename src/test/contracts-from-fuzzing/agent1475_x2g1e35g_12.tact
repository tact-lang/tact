struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Bool?;
    f4: Int?;
    f5: String;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: Int?;
    f10: String;
    f11: Bool;
    f12: Int;
    f13: String?;
    f14: Bool?;
    f15: Int;
}

contract BigFields {
    state: LargeStruct;

    init() {
        self.state = LargeStruct{
            f1:1, f2:true, f3:null, f4:null, f5:"x", f6:null, f7:7, f8:false,
            f9:null, f10:"y", f11:true, f12:12, f13:null, f14:null, f15:15,
        };
    }
}