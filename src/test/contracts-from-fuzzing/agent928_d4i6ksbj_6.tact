struct LargeStruct {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: Bool?;
    f6: String?;
    f7: Int?;
    f8: Bool;
    f9: String;
    f10: Int;
}

contract LargeStorage {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1:1, f2:2, f3:true, f4:"a", f5:null, f6:"b", f7:3, f8:false, f9:"c", f10:4
        };
    }
}