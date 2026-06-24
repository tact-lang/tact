struct DeepFlag {
    midFlag: Bool;
}

contract FlagsNested {
    level1: Bool;
    nested: DeepFlag;

    init() {
        self.level1 = false;
        self.nested = DeepFlag{ midFlag: true };
    }
}
