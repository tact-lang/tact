struct OptWithDefault {
    a: Int? = null;
    b: Bool? = false;
}

contract UseOptDefaults {
    f: OptWithDefault;

    init() {
        self.f = OptWithDefault{};
    }
}
