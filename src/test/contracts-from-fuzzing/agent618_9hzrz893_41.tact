struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = false;
    f: String? = null;
}

contract UsesManyDefaults {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{};
    }
}