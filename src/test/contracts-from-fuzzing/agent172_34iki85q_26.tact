struct OptMixDefaults {
    a: Int? = 42;
    b: String? = "test";
    c: Bool? = true;
    d: Int;
    e: String;
}

contract OptNonNullDefaults {
    val: OptMixDefaults;

    init() {
        self.val = OptMixDefaults{
            d: 7,
            e: "fixed"
        };
    }
}