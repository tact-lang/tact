struct Defaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "hello";
}

contract DefaultsTest {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}