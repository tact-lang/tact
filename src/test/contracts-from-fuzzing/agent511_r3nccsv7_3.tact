struct HugeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String;
    f6: Bool?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
}

contract ManyFields {
    big: HugeStruct;

    init() {
        self.big = HugeStruct{
            f1:1,f2:true,f3:"x",f4:null,f5:"y",
            f6:false,f7:7,f8:true,f9:"z",f10:10
        };
    }
}