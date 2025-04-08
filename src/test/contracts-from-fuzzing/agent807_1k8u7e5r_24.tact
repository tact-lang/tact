struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefaultOptVals {
    val: OptionalDefaults;
    init() {
        self.val = OptionalDefaults{};
    }
}