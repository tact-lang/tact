struct StructWithManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: String?;
    f6: Int as uint8;
    f7: Int as uint16;
    f8: Int as uint32;
    f9: Int as uint64;
    f10: Int;
    f11: Bool;
    f12: String;
}

contract ComplexFields {
    data: StructWithManyFields;
    init() {
        self.data = StructWithManyFields{
            f1:0, f2:true, f3:"x", f4:null, f5:null, f6:1,
            f7:2,f8:3,f9:4,f10:5,f11:false,f12:"" };
    }
}