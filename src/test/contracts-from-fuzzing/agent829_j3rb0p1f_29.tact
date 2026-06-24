struct MultipleDefaults {
    opt: Int? = null;
    flag: Bool = false;
    num: Int = 42;
}

contract ComboDefaults {
    s: MultipleDefaults;

    init() {
        self.s = MultipleDefaults{};
    }
}