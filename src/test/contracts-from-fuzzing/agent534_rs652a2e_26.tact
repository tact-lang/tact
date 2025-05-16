struct OptionalsAndDefaults {
    opt: Int?;
    def: Int = 20;
    optdef: Int? = null;
}

contract OptionDefaultTest {
    test: OptionalsAndDefaults;

    init() {
        self.test = OptionalsAndDefaults{
            opt: null,
            // def omitted
            // optdef omitted
        };
    }
}