struct DefaultsNested {
    innerVal: Int = 123;
    optField: Int?;
}

struct ParentWithDefaults {
    f1: Int = 1;
    nested: DefaultsNested;
}

contract DefaultsDeepTest {
    nestedDefaults: ParentWithDefaults;

    init() {
        self.nestedDefaults = ParentWithDefaults{
            nested: DefaultsNested{ optField: null }
        };
    }
}