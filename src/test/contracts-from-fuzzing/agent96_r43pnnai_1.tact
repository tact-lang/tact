struct NestedOptional {
    innerOpt: Int?;
}

contract DeepOptionalTest {
    optLvl1: NestedOptional?;

    init() {
        self.optLvl1 = null;
    }
}