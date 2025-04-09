struct OptionalNestedDefaults {
    i: Int? = null;
    inner: InnerOptDefault? = null;
}

struct InnerOptDefault {
    flag: Bool = false;
    s: String? = null;
}

contract NestedOptDefaults {
    data: OptionalNestedDefaults;

    init() {
        self.data = OptionalNestedDefaults{};
    }
}