struct BoolFlags {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
}

contract BoolFlagsTest {
    flags: BoolFlags;
    init() {
        self.flags = BoolFlags{
            flag1:true,
            flag2:true,
            flag3:false,
            flag4:false
        };
    }
}