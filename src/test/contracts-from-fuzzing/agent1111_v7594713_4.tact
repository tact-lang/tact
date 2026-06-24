struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Int?;
    f5: Bool;
    f6: Int;
    f7: Int?;
    f8: Bool;
    f9: Int;
    f10: Bool?;
}

contract WideStructContract {
    d: ManyFields;

    init() {
        self.d = ManyFields{
            f1:1,f2:2,f3:true,f4:null,f5:false,f6:6,f7:7,f8:true,f9:9,f10:null
        };
    }
}