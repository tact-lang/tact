struct DefaultVals {
    x: Int = 15;
    y: Bool = false;
    z: String = "hello";
}

contract DefaultsTest {
    d: DefaultVals;

    init() {
        self.d = DefaultVals{};
    }
}