struct LongStruct {
    a1: Int;
    a2: Bool;
    a3: Int;
    a4: Int;
    a5: Bool;
    a6: Bool;
    a7: Int;
    a8: Int;
    a9: Bool;
    a10: Int;
    a11: Int;
    a12: Bool;
    a13: Int;
    a14: Int;
    a15: Bool;
    a16: Int;
    a17: Int;
    a18: Bool;
    a19: Bool;
    a20: Int;
}

contract Test {
    big: LongStruct;
    init() {
        self.big = LongStruct{
            a1:1,a2:true,a3:1,a4:1,a5:true,a6:true,a7:1,a8:1,a9:true,a10:1,
            a11:1,a12:true,a13:1,a14:1,a15:true,a16:1,a17:1,a18:true,a19:true,a20:1
        };
    }
    receive(){ dump(self.big.a1); }
}