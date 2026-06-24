struct BoolFlags {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
    flag6: Bool;
    flag7: Bool;
    flag8: Bool;
}

contract BoolsPacked {
    flags: BoolFlags = BoolFlags{
        flag1:true, flag2:false, flag3:true, flag4:false,
        flag5:true, flag6:false, flag7:true, flag8:false
    };

    receive() {
        self.flags = BoolFlags{
            flag1:false, flag2:true, flag3:false, flag4:true,
            flag5:false, flag6:true, flag7:false, flag8:true
        };
    }
}