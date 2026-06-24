struct InnerDefaults {
    x: Int = 12;
    y: Bool = true;
    z: String = "hey";
}

contract DefaultsAtAllLevels {
    val: InnerDefaults;

    init() {
        self.val = InnerDefaults{};
    }
}