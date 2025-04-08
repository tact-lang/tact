struct Defaulted {
    x: Int = 1;
    y: Bool = false;
    z: String = "hello";
}

contract DefaultsTest {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}
