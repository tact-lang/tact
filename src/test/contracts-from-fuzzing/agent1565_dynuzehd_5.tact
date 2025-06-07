struct LongStruct {
    f1: Int; f2: Bool; f3: String;
    f4: Int?; f5: String?; f6: Bool;
    f7: Int; f8: Bool; f9: String;
    f10: Int?; f11: String?; f12: Bool;
    f13: Int; f14: Bool; f15: String;
}

contract LongFieldsTest {
    state: LongStruct;

    init() {
        self.state = LongStruct{
            f1:1, f2:true, f3:"a",
            f4:null, f5:null, f6:false,
            f7:2, f8:true, f9:"b",
            f10:null, f11:"x", f12:true,
            f13:3, f14:false, f15:"c",
        };
    }
}