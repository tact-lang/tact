struct SWithManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: String = "x";
}

contract WithManyDefaults {
    val: SWithManyDefaults;

    init() {
        self.val = SWithManyDefaults{};
    }
}