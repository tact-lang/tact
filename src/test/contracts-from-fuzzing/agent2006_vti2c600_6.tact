struct FlatDefaults {
    x: Int = 7;
    y: String = "ok";
    z: Bool = false;
}

contract DefaultsTest {
    info: FlatDefaults;
    init() {
        self.info = FlatDefaults{};
    }
}