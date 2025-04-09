struct OnlyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
}

contract UseOnlyDefaults {
    fld: OnlyDefaults;

    init() {
        self.fld = OnlyDefaults{};
    }
}
