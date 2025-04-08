struct OnlyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: String = "foo";
    d: Bool = true;
}

contract DefaultsStruct {
    data: OnlyDefaults;

    init() {
        self.data = OnlyDefaults{};
    }
}