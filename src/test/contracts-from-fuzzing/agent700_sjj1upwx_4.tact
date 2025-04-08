struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int; 
    f11: Bool; 
    f12: String; 
    f13: Int;
    f14: Bool;
    f15: String;
}

contract StructWithManyFields {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            f1:1,f2:true,f3:"a",f4:null,f5:null,f6:null,f7:2,f8:false,f9:"b",
            f10:3,f11:true,f12:"c",f13:4,f14:false,f15:"d"
        };
    }
}