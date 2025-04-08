struct DefaultsWithOptionals {
    x: Int = 5;
    y: Int? = null;
    z: Bool? = null;
}

contract Test {
    f: DefaultsWithOptionals;
    init() {
        self.f = DefaultsWithOptionals{};
    }
}