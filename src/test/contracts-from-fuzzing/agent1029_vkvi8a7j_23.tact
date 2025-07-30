struct ManyOptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Slice? = null;
    d: String? = null;
}

contract TestOptDefaults {
    val: ManyOptDefaults;
    init() {
        self.val = ManyOptDefaults{};
    }
}