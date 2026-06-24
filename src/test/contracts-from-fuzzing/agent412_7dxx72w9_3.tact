struct LargeStruct {
    f1: Int;
    f2: Int?;
    f3: Int;
    f4: Bool;
    f5: Bool?;
    f6: String;
    f7: String?;
    f8: Int;
    f9: Int?;
    f10: Bool;
    f11: Int;
    f12: String;
    f13: Bool?;
    f14: Int?;
    f15: String?;
    f16: Bool;
    f17: Int;
    f18: Int?;
    f19: Bool;
    f20: String;
    f21: String?;
}

contract LargeFields {
    data: LargeStruct = LargeStruct{
        f1:1, f2:null, f3:3, f4:true, f5:null, f6:"a", f7:null, f8:8,
        f9:null, f10:false, f11:11, f12:"b", f13:null, f14:null, f15:null, f16:true,
        f17:17, f18:null, f19:false, f20:"c", f21:null
    };

    receive() {
        let _ = self.data.f1 + 1;
    }
}