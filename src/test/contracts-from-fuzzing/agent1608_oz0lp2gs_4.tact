struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: Int;
    f7: Bool;
    f8: Int?;
    f9: Bool?;
    f10: String;
}

contract TestManyFields {
    s: ManyFields = ManyFields{
        f1:1, f2:true, f3:null, f4:false, f5:"hi",
        f6:2, f7:false, f8:8, f9:null, f10:"bye"
    };

    init() {
        self.s = ManyFields{
            f1:10, f2:false, f3:30, f4:true, f5:"foo",
            f6:20, f7:true, f8:null, f9:false, f10:"bar"
        };
    }
}