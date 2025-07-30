struct WideStruct {
    f01: Int;
    f02: Int;
    f03: Bool;
    f04: String;
    f05: Bool;
    f06: String;
    f07: Int;
    f08: Int;
    f09: Bool;
    f10: String;
    f11: Bool;
    f12: String;
    f13: Int;
    f14: Int;
    f15: Bool;
    f16: String;
}

contract WideFields {
    data: WideStruct;

    init() {
        self.data = WideStruct{
            f01:1, f02:2, f03:true, f04:"a", f05:false, f06:"b",
            f07:7, f08:8, f09:false, f10:"c", f11:true, f12:"d",
            f13:13, f14:14, f15:true, f16:"e",
        };
    }
}