struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Bool;
    f8: Bool;
    f9: Bool?;
    f10: Bool?;
    f11: String;
    f12: String;
    f13: String;
    f14: String;
}

contract LargeStructTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:true,f8:false,f9:true,f10:null,
            f11:"a", f12:"b", f13:"c", f14:"d"
        };
    }
}