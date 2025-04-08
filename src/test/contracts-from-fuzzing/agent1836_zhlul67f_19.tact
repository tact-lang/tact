struct ManyOptBool {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
    f4: Bool?;
    f5: Bool?;
    f6: Bool?;
    f7: Bool?;
    f8: Bool?;
}

contract OptBoolPackedTest {
    flags: ManyOptBool;

    init() {
        self.flags = ManyOptBool{
            f1:null, f2:true, f3:null, f4:false,
            f5:true, f6:null, f7:false, f8:true,
        };
    }
}