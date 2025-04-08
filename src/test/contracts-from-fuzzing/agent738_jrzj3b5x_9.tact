struct NestedDefaults {
    x: Int = 1;
    y: Bool = true;
}

struct UsesNested {
    foo: Int = 5;
    bar: NestedDefaults;
}

contract NestedDefaultsContract {
    val: UsesNested;

    init() {
        self.val = UsesNested{bar: NestedDefaults{}};
    }
}
