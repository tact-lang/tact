struct Defaulted {
    x: Int = 10;
    y: Bool = true;
    z: String? = null;
}

contract HasDefaults {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}