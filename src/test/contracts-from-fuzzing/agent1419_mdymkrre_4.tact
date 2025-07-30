struct LongStruct {
    f1: Int; f2: Bool; f3: String; f4: Bool?; f5: Int; f6: Bool; f7: String; f8: Bool?;
    f9: Int; f10: Bool; f11: String; f12: Bool?; f13: Int; f14: Bool; f15: String; f16: Bool?;
}

contract LongStructTest {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            f1:1, f2:true, f3:"a", f4:null,
            f5:2, f6:false, f7:"b", f8:true,
            f9:3, f10:true, f11:"c", f12:null,
            f13:4, f14:true, f15:"d", f16:false
        };
    }
}