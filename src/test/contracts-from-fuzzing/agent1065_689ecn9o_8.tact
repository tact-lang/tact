struct NestedWithDefaults {
    foo: Int = 10;
    bar: Bool;
}

struct ContainNestedDefaults {
    nested: NestedWithDefaults;
    flag: Bool = false;
}

contract NestedDefaultTest {
    val: ContainNestedDefaults;
    init() {
        self.val = ContainNestedDefaults{
            nested: NestedWithDefaults{ bar: true },
            flag: true
        };
    }
}