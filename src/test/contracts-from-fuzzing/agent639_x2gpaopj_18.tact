struct NestedWithDefaults {
    flag: Bool = true;
    val: Int = 10;
}

struct HasNestedDefaults {
    nested: NestedWithDefaults;
}

contract DefaultedNested {
    s: HasNestedDefaults;

    init() {
        self.s = HasNestedDefaults{
            nested: NestedWithDefaults{}
        };
    }
}