struct LargeStruct {
    f0: Int;
    f1: Bool;
    f2: String;
    f3: Int?;
    f4: Bool?;
    f5: String?;
    f6: Int;
    f7: Bool;
    f8: String;
    f9: Int?;
    f10: Bool?;
    f11: String?;
}

contract ExtensiveFields {
    store: LargeStruct;
    init() {
        self.store = LargeStruct{
            f0:0, f1:true, f2:"a",
            f3:null, f4:null, f5:null,
            f6:6, f7:false, f8:"b",
            f9:null, f10:null, f11:null
        };
    }
}