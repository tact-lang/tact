struct ManyDefaults {
    i: Int = 1;
    b: Bool = true;
    s: String = "ok";
}

contract DefaultsTest {
    data: ManyDefaults;
    init() {
        self.data = ManyDefaults{};
    }
}