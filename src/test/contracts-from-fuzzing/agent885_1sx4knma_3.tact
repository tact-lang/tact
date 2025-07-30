struct LargeStruct {
    f1: Int; f2: Bool; f3: String; f4: Int; f5: String;
    f6: Bool; f7: Int; f8: String; f9: Bool; f10: Int;
    f11: String; f12: Bool; f13: Int; f14: String; f15: Bool;
    f16: Int; f17: String; f18: Bool; f19: Int; f20: String;
}

contract TestContract {
    bigField: LargeStruct;

    init() {
        self.bigField = LargeStruct{
            f1:1, f2:true, f3:"a", f4:2, f5:"b",
            f6:false, f7:3, f8:"c", f9:true, f10:4,
            f11:"d", f12:false, f13:5, f14:"e", f15:true,
            f16:6, f17:"f", f18:false, f19:7, f20:"g",
        };
    }
}