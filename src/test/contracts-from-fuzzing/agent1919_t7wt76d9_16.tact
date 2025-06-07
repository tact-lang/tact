struct HasBool {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
}

contract TestContract {
    flags: HasBool;
    init() {
        self.flags = HasBool{
            flag1: true,
            flag2: false,
            flag3: true
        };
    }
}