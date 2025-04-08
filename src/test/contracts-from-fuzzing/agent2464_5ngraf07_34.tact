struct BoolDefaults {
    flag1: Bool;
    flag2: Bool;
}

contract BooleanContract {
    s: BoolDefaults;
    init() {
        self.s = BoolDefaults{
            flag1:true,
            flag2:false
        };
    }
}
