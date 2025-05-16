struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
}

contract Defaults {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{};
    }
}