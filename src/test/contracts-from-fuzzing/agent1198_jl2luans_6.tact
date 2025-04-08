struct DefaultNested {
    a: Int = 10;
    b: Bool = true;
    c: String = "default";
    d: Int? = null;
    e: Bool? = null;
}

contract DefaultsTest {
    x: DefaultNested;

    init() {
        self.x = DefaultNested{};
    }
}