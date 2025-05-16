struct ManyDefaults {
    x: Int? = null;
    y: Int? = 42;
    z: Bool? = null;
    w: Bool? = false;
    s: String? = null;
    t: String? = "hi";
}

contract OptionalDefaultsStruct {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{};
    }
}
