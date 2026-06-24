struct ManyFieldsOpt {
    f1: Int;
    f2: Bool;
    f3: Address?;
    f4: Int;
    f5: Bool;
    f6: String;
    f7: Bool;
    f8: String;
    f9: Int;
    f10: Bool;
}

contract LargeStructOptFields {
    mf: ManyFieldsOpt;

    init() {
        self.mf = ManyFieldsOpt{
            f1:1,f2:true,f3:null,f4:2,f5:false,
            f6:"a",f7:true,f8:"b",f9:3,f10:false
        };
    }
}