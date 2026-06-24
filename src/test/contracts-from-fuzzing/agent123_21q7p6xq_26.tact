struct SDefaults {
    x: Int = 5;
    y: String = "abc";
    z: Bool = true;
}

contract TestDefaults {
    val: SDefaults;

    init() {
        self.val = SDefaults{};
    }
}