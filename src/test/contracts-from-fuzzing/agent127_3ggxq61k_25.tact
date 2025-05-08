struct OptionalStringDefault {
    val: String? = null;
}

contract WithOptionalStringDefault {
    s: OptionalStringDefault;

    init() {
        self.s = OptionalStringDefault{ val: null };
    }
}