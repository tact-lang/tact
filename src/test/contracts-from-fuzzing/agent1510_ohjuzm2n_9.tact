struct LargeStruct {
    a0: Int;
    a1: Bool;
    a2: Int;
    a3: Bool;
    a4: Int;
    a5: Bool;
    a6: Int;
    a7: Bool;
    a8: Int;
    a9: Bool;
    a10: Int;
    a11: Bool;
    a12: Int;
    a13: Bool;
    a14: Int;
    a15: Bool;
}

contract TestContract {
    big: LargeStruct = LargeStruct{
        a0:0,a1:false,a2:0,a3:false,a4:0,a5:false,a6:0,a7:false,
        a8:0,a9:false,a10:0,a11:false,a12:0,a13:false,a14:0,a15:false
    };

    init() {
        self.big = LargeStruct{
            a0:1,a1:true,a2:2,a3:true,a4:3,a5:true,a6:4,a7:true,
            a8:5,a9:true,a10:6,a11:true,a12:7,a13:true,a14:8,a15:true
        };
    }

    receive() {
        let _ = self.big;
    }
}