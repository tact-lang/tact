struct MultiDefaults {
    x: Int = 1;
    y: Int?;
    z: Bool = false;
}

contract DefaultsTest {
    st: MultiDefaults;

    init() {
        self.st = MultiDefaults{};
    }
}