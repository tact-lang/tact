struct NestedDefaults {
    foo: Int = 1;
    bar: Bool = true;
}

struct HasNestedDefaults {
    nested: NestedDefaults = NestedDefaults{};
    nopt: NestedDefaults? = null;
}

contract NestedDefaultsContract {
    data: HasNestedDefaults;

    init() {
        self.data = HasNestedDefaults{};
    }

    receive() {}
}