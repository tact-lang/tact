struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    s: String? = "";
}

contract OptDefaultsComp {
    ox: OptionalWithDefaults = OptionalWithDefaults{};

    init() {
        self.ox = self.ox;
    }

    receive() {
        let _ = self.ox;
    }
}