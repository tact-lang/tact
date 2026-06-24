struct LongList {
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
    f17: Int;
    f18: Bool;
    f19: Int;
    f20: Bool;
}

contract LongContract {
    data: LongList;
    
    init() {
        self.data = LongList{
            f1:1,f2:true,f3:2,f4:false,f5:3,f6:true,f7:4,f8:false,f9:5,f10:true,
            f11:6,f12:false,f13:7,f14:true,f15:8,f16:false,f17:9,f18:true,f19:10,f20:false
        };
    }
}