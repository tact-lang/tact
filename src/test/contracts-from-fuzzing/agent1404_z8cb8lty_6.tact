struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "str";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract TestDefaults {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}
