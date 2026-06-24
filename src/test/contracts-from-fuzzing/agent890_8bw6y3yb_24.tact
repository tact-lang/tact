struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "s";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract Test {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}