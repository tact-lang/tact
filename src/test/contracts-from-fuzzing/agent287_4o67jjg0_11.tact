struct DefaultsCheck {
    x: Int = 7;
    y: Bool = false;
    z: String = "default";
}

contract DefaultsStructTest {
    d: DefaultsCheck;
    init() {
        self.d = DefaultsCheck{};
    }
}