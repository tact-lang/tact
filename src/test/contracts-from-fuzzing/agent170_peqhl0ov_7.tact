struct LargeStruct {
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
    f11: Bool?;
    f12: String;
    f13: Int;
    f14: Bool;
    f15: String;
}

contract TestContract {
    big: LargeStruct = LargeStruct{
        f1:1,
        f2:true,
        f3:"a",
        f4:null,
        f5:false,
        f6:"b",
        f7:2,
        f8:true,
        f9:"c",
        f10:10,
        f11:null,
        f12:"d",
        f13:3,
        f14:false,
        f15:"e",
    };

    init() {
        self.big = LargeStruct{
            f1:10,
            f2:false,
            f3:"x",
            f4:20,
            f5:true,
            f6:"y",
            f7:30,
            f8:false,
            f9:"z",
            f10:40,
            f11:false,
            f12:"q",
            f13:50,
            f14:true,
            f15:"w",
        };
    }

    receive() {
        let _ = self.big.f14;
    }
}