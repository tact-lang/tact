struct OnlyDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "x";
}

contract StructWithOnlyDefaults {
    rec: OnlyDefaults;

    init() {
        self.rec = OnlyDefaults{};
    }
}