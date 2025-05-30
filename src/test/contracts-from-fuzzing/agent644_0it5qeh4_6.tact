struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
}

contract Test {
    mf: ManyFields;

    init() {
        self.mf = ManyFields{
            f1:1,f2:true,f3:"s3",f4:null,f5:false,f6:"s6",f7:7,f8:true,f9:"s9",f10:10
        };
    }
}