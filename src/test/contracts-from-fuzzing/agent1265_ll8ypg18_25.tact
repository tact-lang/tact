struct BoolConfig {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    opt1: Bool?;
    opt2: Bool?;
    opt3: Bool?;
}

contract Flags {
    data: BoolConfig;
    init() {
        self.data = BoolConfig{
            flag1:true, flag2:false, flag3:true,
            opt1:null, opt2:true, opt3:false
        };
    }
}