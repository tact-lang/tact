struct LongStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: String;
    f8: String;
    f9: String;
    f10: Bool;
    f11: Int;
    f12: Int;
    f13: String;
}

contract LongStructTest {
    testField: LongStruct;

    init() {
        self.testField = LongStruct{
            f1:1, f2:2, f3:3, f4:true, f5:false, f6:true,
            f7:"one", f8:"two", f9:"three", f10:false,
            f11:11, f12:12, f13:"done"
        };
    }
}