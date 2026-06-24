struct OptWithDefaults {
    aa: Int? = null;
    bb: Bool? = null;
}

contract OptDefaults {
    o: OptWithDefaults;

    init() {
        self.o = OptWithDefaults{};
    }
}