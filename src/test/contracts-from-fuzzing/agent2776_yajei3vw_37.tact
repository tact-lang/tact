struct Defaults {
    x: Int = 1;
}

struct ContainsDefaults {
    a: Defaults;
}

contract NestedInlineDefaults {
    val: ContainsDefaults;

    init() {
        self.val = ContainsDefaults{ a: Defaults{} };
    }
}
