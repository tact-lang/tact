struct NestedWithDefaults {
    val: Int = 5;
}

struct OuterWithNestedDefault {
    nested: NestedWithDefaults;
    flag: Bool;
}

contract NestedDefaultsTest {
    data: OuterWithNestedDefault;

    init() {
        self.data = OuterWithNestedDefault{
            nested: NestedWithDefaults{},
            flag: false,
        };
    }
}