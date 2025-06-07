struct InitDefaults {
    x: Int = 1;
    y: Bool = false;
    z: String = "hi";
}

contract DefaultsTest {
    s: InitDefaults;

    init() {
        self.s = InitDefaults{};
    }
}