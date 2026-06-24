struct LargeStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Bool;
    f5: Int;
    f6: Bool;
    f7: Int;
    f8: Bool;
    f9: Int;
    f10: Bool;
    f11: Int;
    f12: Bool;
    f13: Int;
    f14: Bool;
    f15: Int;
    f16: Bool;
}

contract ManyFieldStorage {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            f1:1,f2:2,f3:3,f4:true,f5:5,f6:false,f7:7,f8:true,f9:9,f10:false,f11:11,f12:true,f13:13,f14:false,f15:15,f16:true
        };
    }
}