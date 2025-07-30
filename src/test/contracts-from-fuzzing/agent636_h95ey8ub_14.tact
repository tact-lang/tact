struct OptionalNestedDefaults {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    flag: Bool = true;
}

contract OptionalNestedDefaultsTest {
    s: OptionalNestedDefaults;

    init() {
        self.s = OptionalNestedDefaults{
            innerOpt: InnerOpt{}
        };
    }
}