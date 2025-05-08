struct ManyDefaults {
    x: Int = 1;
    y: Int = 2;
    z: Int = 3;
    f: Bool = true;
    g: Bool = false;
}

contract DefaultsContract {
    data: ManyDefaults;
    init() {
        self.data = ManyDefaults{};
    }
}