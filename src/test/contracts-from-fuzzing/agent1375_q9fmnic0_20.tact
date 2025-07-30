struct Defaulted {
    a: Int = 42;
    b: Bool = true;
}

contract WithDefaults {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}