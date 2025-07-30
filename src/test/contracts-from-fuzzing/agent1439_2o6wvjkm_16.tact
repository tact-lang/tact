struct WithBool {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
}

contract BoolStorage {
    b: WithBool;

    init() {
        self.b = WithBool{flag1:true, flag2:false, flag3:true};
    }
}