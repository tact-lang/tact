struct NestedDefaults {
    x: Int = 1;
    y: Bool = false;
}

struct ParentDefaults {
    s: String = "hi";
    inner: NestedDefaults = NestedDefaults{};
}

contract NestedDefaultsContract {
    data: ParentDefaults;

    init() {
        self.data = ParentDefaults{};
    }
}