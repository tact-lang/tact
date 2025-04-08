struct NestedDefaults {
    a: Int = 12;
    b: String = "abc";
    c: Bool = true;
}

struct TopWithNestedDefaults {
    nested: NestedDefaults;
    flag: Bool = false;
}

contract ContractWithNestedDefaults {
    store: TopWithNestedDefaults;

    init() {
        self.store = TopWithNestedDefaults{
            nested: NestedDefaults{},
            flag: true
        };
    }
}