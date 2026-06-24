struct ManyManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool;
    f5: Int;
    f6: Int?;
    f7: Bool;
    f8: Int;
    f9: Int?;
    f10: Bool;
    f11: Int;
    f12: Int?;
}

contract TestLargeStruct {
    data: ManyManyFields;

    init() {
        self.data = ManyManyFields{
            f1:1,f2:true,f3:null,f4:false,f5:5,f6:null,
            f7:true,f8:8,f9:null,f10:false,f11:11,f12:null
        };
    }
}
