// struct with maximal reasonable number of fields
struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: Int;
    f6: Bool;
    f7: String;
    f8: Int;
    f9: Bool;
    f10: String;
    f11: Int;
    f12: Bool;
    f13: String;
    f14: Int;
    f15: Bool;
    f16: String;
    f17: Int;
    f18: Bool;
    f19: String;
    f20: Int;
}

contract TestContract {
    big: ManyFields;
    init() {
        self.big = ManyFields{
            f1:1, f2:2, f3:true, f4:"a", f5:5, f6:false, f7:"b", f8:8, f9:true, f10:"c",
            f11:11, f12:false, f13:"d", f14:14, f15:true, f16:"e", f17:17, f18:true, f19:"f", f20:20,
        };
    }
}
