struct LargeStruct {
    f1: Int; f2: Bool; f3: String; f4: Int; f5: Bool; f6: String; f7: Address; f8: Int; f9: Bool; f10: String;
    f11: Int; f12: Bool; f13: String; f14: Int; f15: Bool; f16: String; f17: Address; f18: Int; f19: Bool; f20: String;
}

contract StructBig {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1:1, f2:true, f3:"3", f4:4, f5:false, f6:"6", f7:myAddress(), f8:8, f9:true, f10:"10",
            f11:11, f12:false, f13:"13", f14:14, f15:true, f16:"16", f17:myAddress(), f18:18, f19:false, f20:"20"
        };
    }
}