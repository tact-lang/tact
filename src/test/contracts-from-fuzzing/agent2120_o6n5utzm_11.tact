struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String?;
    f6: Bool?;
    f7: Int;
    f8: Bool;
    f9: String;
}

contract MixedFields {
    data: ManyFields;
    init() {
        self.data = ManyFields{
            f1:1,f2:true,f3:"hi",f4:null,f5:null,f6:null,f7:2,f8:false,f9:"bye"
        };
    }
}