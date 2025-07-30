struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Int;
    f12: Int;
    f13: Int;
    f14: Int;
    f15: Int;
    f16: Int;
}

contract TestContract {
    data: ManyFields;
    
    init() {
        self.data = ManyFields{
            f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,
            f9:9,f10:10,f11:11,f12:12,f13:13,f14:14,f15:15,f16:16
        };
    }
    receive() {
        self.data = ManyFields{
            f1:16,f2:15,f3:14,f4:13,f5:12,f6:11,f7:10,f8:9,
            f9:8,f10:7,f11:6,f12:5,f13:4,f14:3,f15:2,f16:1
        };
    }
}