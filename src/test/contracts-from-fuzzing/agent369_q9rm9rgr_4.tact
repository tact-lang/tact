struct LargeStruct {
    f01: Int;
    f02: Int;
    f03: Int;
    f04: Int;
    f05: Int;
    f06: Int;
    f07: Int;
    f08: Int;
    f09: Int;
    f10: Int;
    f11: Bool;
    f12: Bool;
    f13: Bool;
    f14: Bool;
    f15: Bool;
    f16: String;
    f17: String;
    f18: String;
    f19: String;
    f20: String;
}

contract TestContract {
    st: LargeStruct;

    init() {
        self.st = LargeStruct{
            f01: 1,f02:2,f03:3,f04:4,f05:5,f06:6,f07:7,f08:8,f09:9,f10:10,
            f11:true,f12:false,f13:true,f14:false,f15:true,
            f16:"a",f17:"b",f18:"c",f19:"d",f20:"e"
        };
    }
}