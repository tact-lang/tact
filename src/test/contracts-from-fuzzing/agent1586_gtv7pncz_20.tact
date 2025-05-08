struct SBool {
    flag: Bool;
    optflag: Bool?;
}

contract NestedBooleans {
    s: SBool;

    init() {
        self.s = SBool {
            flag: true,
            optflag: null
        };
    }
}