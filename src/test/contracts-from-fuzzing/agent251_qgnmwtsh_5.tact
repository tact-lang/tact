struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Bool;
    f7: Bool;
    f8: Bool;
    f9: Bool;
    f10: Bool;
}

contract BigFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1:1, f2:2, f3:3, f4:4, f5:5,
            f6:true, f7:false, f8:true, f9:false, f10:true
        };
    }
}