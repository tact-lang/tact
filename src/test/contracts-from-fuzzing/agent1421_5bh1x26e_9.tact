struct ConstDefaults {
    x: Int = 5 + 7;
    b: Bool = true;
    s: String = "abc";
}

contract StructWithConstDefaults {
    data: ConstDefaults;

    init() {
        self.data = ConstDefaults{};
    }
}