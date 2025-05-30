struct DefaultsMix {
    x: Int = 1;
    y: Int? = null;
    b: Bool = false;
    c: Bool? = null;
    s: String = "abc";
    t: String? = null;
}

contract DefaultsTest {
    thing: DefaultsMix;

    init() {
        self.thing = DefaultsMix{};
    }
}
