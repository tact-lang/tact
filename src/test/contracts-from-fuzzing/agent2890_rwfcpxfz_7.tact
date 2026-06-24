struct DefaultsOpt {
    x: Int = 10;
    y: Bool?; // defaults to null
    z: String = "hello";
}

contract DefaultNestedTest {
    s: DefaultsOpt;

    init() {
        self.s = DefaultsOpt{};
    }
}