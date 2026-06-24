struct ManyFieldsStruct {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool;
    f5: Int?;
    f6: Bool;
    f7: Int?;
    f8: Bool;
    f9: Int?;
    f10: Bool;
}

contract TestContract {
    data: ManyFieldsStruct;

    init() {
        self.data = ManyFieldsStruct{
            f1:1, f2:true, f3:null, f4:false, f5:null,
            f6:true, f7: null, f8: false, f9:null, f10:true
        };
    }
}