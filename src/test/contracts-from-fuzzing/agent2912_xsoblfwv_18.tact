struct OptionalStringDefault {
    s: String? = null;
    n: Int? = null;
}

contract DefaultNulls {
    val: OptionalStringDefault;
    init() {
        self.val = OptionalStringDefault{};
    }
}