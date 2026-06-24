struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: String? = null;
}

contract Test {
    x: ManyDefaults;

    init() {
        self.x = ManyDefaults{};
    }
}