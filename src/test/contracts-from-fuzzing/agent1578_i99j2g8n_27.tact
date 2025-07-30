struct ManyDefaults {
    a: Int = 0;
    b: Int = 1;
    c: Bool = false;
    d: Bool = true;
    e: String = "";
    f: String = "abc";
}

contract TestContract {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{};
    }
}