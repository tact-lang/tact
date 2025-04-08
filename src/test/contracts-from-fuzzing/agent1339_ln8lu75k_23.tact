struct HasOnlyDefaults {
    a: Int = 1;
    b: String = "B";
    c: Bool = false;
}

contract OnlyDefaults {
    val: HasOnlyDefaults;

    init() {
        self.val = HasOnlyDefaults{};
    }
}