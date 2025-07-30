struct NestedOptionalDefaults {
    sub: OptionalSub? = null;
}

struct OptionalSub {
    val: Int? = null;
    flag: Bool? = null;
}

contract NestedOptionalDefaultsContract {
    s: NestedOptionalDefaults;
    init() {
        self.s = NestedOptionalDefaults{};
    }
}