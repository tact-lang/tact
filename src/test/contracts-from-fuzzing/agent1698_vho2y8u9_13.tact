struct NestedDefaults {
    a: Int = 5;
    b: Bool = true;
}

struct UsesNestedDefaults {
    inner: NestedDefaults;
    c: String;
}

contract DefaultsDeeper {
    field: UsesNestedDefaults;

    init() {
        self.field = UsesNestedDefaults{inner: NestedDefaults{}, c:"Hi"};
    }
}