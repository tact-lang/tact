struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: String? = null;
    f: Bool? = null;
}

contract StructWithDefaults {
    data: ManyDefaults;
    init() {
        self.data = ManyDefaults{};
    }
}