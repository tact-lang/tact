struct OptionalsAndDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;

    d: Int = 1;
    e: Bool = true;
    f: String = "s";
}

contract TestContract {
    data: OptionalsAndDefaults;
    init() {
        self.data = OptionalsAndDefaults{};
    }
}