struct NestedDefault {
    a: Int = 1;
    b: Int = 2;
}

struct WithNestedDefault {
    nested: NestedDefault;
    flag: Bool = false;
}

contract ContractWithNestedDefaults {
    field: WithNestedDefault;

    init() {
        self.field = WithNestedDefault{nested: NestedDefault{}, flag: true};
    }
}