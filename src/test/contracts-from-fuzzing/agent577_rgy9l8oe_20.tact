struct WithBool {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
}

contract TestContract {
    s: WithBool;

    init() {
        self.s = WithBool{
            flag1: true, flag2: false, flag3: true,
            flag4: false, flag5: true
        };
    }
}