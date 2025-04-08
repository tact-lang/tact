struct ManyFields {
    f1: Int; f2: Bool; f3: Address; f4: String;
    f5: Int?; f6: Bool?; f7: Address?; f8: String?;
    f9: Int; f10: Bool; f11: Address; f12: String;
    f13: Int?; f14: Bool?; f15: Address?; f16: String?;
}

contract GiantStructFieldTest {
    big: ManyFields;

    init() {
        self.big = ManyFields{
            f1:1, f2:true, f3:myAddress(), f4:"a",
            f5:null, f6:null, f7:null, f8:null,
            f9:9, f10:false, f11:myAddress(), f12:"b",
            f13:null, f14:null, f15:null, f16:null,
        };
    }
}