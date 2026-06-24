struct ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int? = null;
}

contract StructAllDefaults {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{};
    }
}