// Very large struct with many primitive fields
struct ManyPrimitives {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Bool;
    f8: Bool;
    f9: Bool;
    f10: Bool;
    f11: String;
    f12: String;
    f13: String;
    f14: String;
    f15: Int;
    f16: Int;
    f17: Int;
    f18: Int;
    f19: Int;
    f20: Int;
    f21: Bool;
    f22: Bool;
    f23: String;
    f24: String;
    f25: Int;
    f26: Bool;
    f27: String;
    f28: Int;
    f29: Bool;
    f30: String;
}

contract ManyPrimsTest {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,
            f7:true,f8:false,f9:true,f10:true,
            f11:"s11",f12:"s12",f13:"s13",f14:"s14",
            f15:15,f16:16,f17:17,f18:18,f19:19,f20:20,
            f21:false,f22:true,
            f23:"s23",f24:"s24",
            f25:25,f26:true,
            f27:"s27",
            f28:28,
            f29:false,
            f30:"s30"
        };
    }
}