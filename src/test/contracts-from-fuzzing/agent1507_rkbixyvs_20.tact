struct OnlyDefaults {
    a: Int = 1;
    b: String = "str";
    c: Bool = false;
}

contract DefaultStruct {
    field: OnlyDefaults;

    init() {
        self.field = OnlyDefaults{};
    }
}
