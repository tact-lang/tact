struct DefaultBool {
    b1: Bool = true;
    b2: Bool = false;
}

contract BoolDefaults {
    f: DefaultBool;

    init() {
        self.f = DefaultBool{};
    }
}