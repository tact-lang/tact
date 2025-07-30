struct NestedDefaults {
    val: Int = 1;
    optS: String? = null;
}

struct HasNestedDefaults {
    inner: NestedDefaults = NestedDefaults{};
    flag: Bool = true;
}

contract InnerDefaults {
    hd: HasNestedDefaults;

    init() {
        self.hd = HasNestedDefaults{};
    }
}
