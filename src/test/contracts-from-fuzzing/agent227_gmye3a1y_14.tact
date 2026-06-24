struct ManyBools {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
    flag6: Bool;
    flag7: Bool;
    flag8: Bool;
    flag9: Bool;
}

contract TestContract {
    bits: ManyBools;
    init() {
        self.bits = ManyBools{ flag1:true, flag2:false, flag3:true, flag4:false, flag5:true, flag6:false, flag7:true, flag8:true, flag9:false };
    }
}