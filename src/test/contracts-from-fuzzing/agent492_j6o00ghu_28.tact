struct NestedDefaultsInner {
    x: Int = 1;
    y: Int? = null;
}

struct NestedDefaults {
    inner: NestedDefaultsInner = NestedDefaultsInner{};
}

contract DefaultsInNested {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{};
    }
}