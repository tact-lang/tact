struct ManyDefaults {
    v1: Int = 1;
    v2: Bool = false;
    v3: String = "X";
    v4: Int?;
    v5: String?;
}

contract AllDefaults {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{};
    }
}