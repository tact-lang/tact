struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: Int?;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Bool?;
    f11: Int?;
    f12: String?;
}

contract TestContract {
    mf: ManyFields;

    init() {
        self.mf = ManyFields{
            f1:1,f2:true,f3:"a",f4:null,f5:5,f6:"b",
            f7:7,f8:false,f9:"c",f10:true,f11:null,f12:null
        };
    }
}