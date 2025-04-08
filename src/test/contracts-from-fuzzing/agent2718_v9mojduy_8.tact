struct Defaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "str";
    d: Int? = null;
}

contract UsesDefaults {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}