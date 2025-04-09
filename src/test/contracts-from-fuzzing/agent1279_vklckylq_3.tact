struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Bool;
    f8: Bool;
    f9: String;
    f10: String;
    f11: Bool;
    f12: Int;
}

contract WideContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1, f2:2, f3:3, f4:4, f5:5, f6:6,
            f7:true, f8:false,
            f9:"a", f10:"b",
            f11:true,
            f12:12
        };
    }
}