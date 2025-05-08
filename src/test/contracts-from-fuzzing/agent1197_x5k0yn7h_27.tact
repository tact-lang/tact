struct OptionalNestedDefaults {
    optInner: InnerOpt? = null;
}
struct InnerOpt {
    val: Int = 42;
}

contract TestContract {
    s: OptionalNestedDefaults;
    init() {
        self.s = OptionalNestedDefaults{};
    }
}