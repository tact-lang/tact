struct ManyFields {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Int?;
    f5: Bool?;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
    f11: Bool?;
    f12: String;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Int?;
    f17: Bool?;
    f18: String;
    f19: Int;
    f20: Bool;
}

contract LargeStructStore {
    rec: ManyFields;

    init() {
        self.rec = ManyFields{
            f1:1, f2:"2", f3:true, f4:null, f5:false,f6:"6",f7:7,f8:true,f9:"9",f10:null,
            f11:true,f12:"12",f13:13,f14:false,f15:"15",f16:null,f17:true,f18:"18",f19:19,f20:true
        };
    }
}