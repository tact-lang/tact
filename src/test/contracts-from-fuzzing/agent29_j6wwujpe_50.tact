struct LongBoolChain {
    a1: Bool;
    a2: Bool;
    a3: Bool;
    a4: Bool;
    a5: Bool;
    a6: Bool;
    a7: Bool;
    a8: Bool;
    a9: Bool;
    a10: Bool;
}

contract FullBoolChain {
    saved: LongBoolChain;

    init() {
        self.saved = LongBoolChain{
            a1:true,a2:false,a3:true,a4:true,a5:false,a6:true,a7:false,a8:true,a9:false,a10:true
        };
    }
}