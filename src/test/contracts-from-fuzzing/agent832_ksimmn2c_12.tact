struct DefaultFields {
    a: Int = 1;
    b: Bool = false;
    c: String = "ok";
}

contract DefaultsTest {
    x: DefaultFields;

    init() {
        self.x = DefaultFields{};
    }
}