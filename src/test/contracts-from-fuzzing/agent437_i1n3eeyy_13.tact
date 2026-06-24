struct BoolPack {
    flag1: Bool = true;
    flag2: Bool = false;
    flag3: Bool = true;
    flag4: Bool = false;
    flag5: Bool = true;
    flag6: Bool = false;
    flag7: Bool = true;
    flag8: Bool = false;
}

contract PackedFlags {
    flags: BoolPack = BoolPack{};

    init() {
        self.flags = BoolPack{
            flag1:true,flag2:true,flag3:true,flag4:true,
            flag5:false,flag6:true,flag7:false,flag8:true
        };
    }

    receive() {
        let _ = self.flags.flag5;
    }
}