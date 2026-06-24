struct WithBoolDefault {
    flag: Bool = true;
    num: Int;
}

contract BoolDefaults {
    w: WithBoolDefault;
    init() {
        self.w = WithBoolDefault{
            num: 7
        };
    }
}