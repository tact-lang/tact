struct Huge {
    f1: Int;
    f2: Bool;
    f3: Int;
    f4: Bool;
    f5: Int;
    f6: Bool;
    f7: Int;
    f8: Bool;
    f9: Int;
    f10: Bool;
    f11: Int;
    f12: Bool;
    f13: Int;
    f14: Bool;
    f15: Int;
    f16: Bool;
}

contract HugeStructContract {
    st: Huge;

    init() {
        self.st = Huge{
            f1:1, f2:true, f3:3, f4:false,
            f5:5, f6:true, f7:7, f8:false,
            f9:9, f10:true, f11:11, f12:false,
            f13:13, f14:true, f15:15, f16:false
        };
    }
}