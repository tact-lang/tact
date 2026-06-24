struct S {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Int as int32;
    f8: Int as uint64;
    f9: Int;
    f10: Bool;
}

contract Test {
    s: S;

    init() {
        self.s = S{
            f1:1, f2:true, f3:null, f4:null, f5:"ok",
            f6:null, f7:123, f8:456, f9:789, f10:false
        };
    }
}
