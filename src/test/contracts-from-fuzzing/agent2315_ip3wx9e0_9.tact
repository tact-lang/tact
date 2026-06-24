struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "str";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract StructDefaults {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}