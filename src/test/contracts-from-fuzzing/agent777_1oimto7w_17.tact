struct NestedDefaults {
    s: String = "s";
    i: Int = 1;
}

struct UseNested {
    inner: NestedDefaults = NestedDefaults{};
    b: Bool = true;
}

contract NestedDefaultsContract {
    val: UseNested;

    init() {
        self.val = UseNested{};
    }
}