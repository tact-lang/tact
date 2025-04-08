struct BoolOptionMix {
    flag1: Bool;
    flag2: Bool?;
    flag3: Bool;
    flag4: Bool?;
    flag5: Bool;
    flag6: Bool?;
}

contract BoolOptMix {
    mix: BoolOptionMix;
    init() {
        self.mix = BoolOptionMix{
            flag1:true, flag2:null, flag3:false, flag4:true, flag5:true, flag6:null
        };
    }
}