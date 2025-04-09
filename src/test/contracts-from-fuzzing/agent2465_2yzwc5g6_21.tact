struct LargeDefaults {
    a: Int = 1;
    b: Int = 2;
    c: String = "c";
    d: Bool = false;
    e: Int? = null;
    f: String? = null;
}

contract TestContract {
    st: LargeDefaults;
    init() {
        self.st = LargeDefaults{};
    }
}