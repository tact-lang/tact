struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Int as uint8;
    f4: Bool?;
    f5: String;
    f6: String;
    f7: String;
    f8: Int; 
    f9: String; 
    f10: Bool;
    f11: Int;
    f12: Bool;
    f13: String; 
    f14: Int as int64;
    f15: Bool;
    f16: Int?;
    f17: String;
    f18: Bool;
    f19: String;
    f20: Int;
}

contract LargeFields {
    store: LargeStruct;
    init() {
        self.store = LargeStruct{
            f1:1, f2:true, f3:5,
            f4:null, f5:"x", f6:"y", f7:"z", f8:7, f9:"a",
            f10:false, f11:11, f12:true, f13:"b", f14:14,
            f15:false, f16:null, f17:"c",
            f18:true, f19:"d", f20:20
        };
    }
}