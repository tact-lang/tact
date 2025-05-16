struct NestedDefaults {
    a: Int = 1;
    b: Bool = true;
}

struct OuterWithNestedDefault {
    nested: NestedDefaults;
    value: Int;
}

contract NestedDefaultTest {
    field: OuterWithNestedDefault;

    init() {
        self.field = OuterWithNestedDefault {
            nested: NestedDefaults{},
            value: 42
        };
    }
}