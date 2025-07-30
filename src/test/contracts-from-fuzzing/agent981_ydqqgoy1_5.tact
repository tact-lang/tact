struct L {
    a0: Int;
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
    a8: Int;
    a9: Int;
    a10: Int;
    a11: Int;
    a12: Int;
    a13: Int;
    a14: Int;
    a15: Int;
    a16: Int;
    a17: Int;
    a18: Int;
    a19: Int;
}

contract LargeStruct {
    s: L;
    init() {
        self.s = L{
            a0:0,a1:0,a2:0,a3:0,a4:0,a5:0,a6:0,a7:0,a8:0,a9:0,
            a10:0,a11:0,a12:0,a13:0,a14:0,a15:0,a16:0,a17:0,a18:0,a19:0
        };
    }
}