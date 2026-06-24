struct MixedDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract Test {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{};
    }
}