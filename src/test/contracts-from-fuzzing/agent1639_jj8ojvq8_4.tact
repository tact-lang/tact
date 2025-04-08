struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String;
    f6: Bool;
    f7: Int;
    f8: String;
    f9: Int?;
    f10: Bool;
    f11: String;
    f12: Int;
}

contract ManyFields {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1:1, f2:true, f3:"a", f4:null, f5:"b", f6:false,
            f7:7, f8:"c", f9:9, f10:true, f11:"d", f12:12,
        };
    }
}
