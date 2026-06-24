struct SDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "zzz";
}

contract TestStructDefaults {
    data: SDefaults;

    init() {
        self.data = SDefaults{};
    }
}