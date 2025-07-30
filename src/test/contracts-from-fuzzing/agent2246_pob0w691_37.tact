struct OptWithDefaults {
    a: Int? = 1;
    b: String? = "hello";
}

contract OptDefComb {
    f: OptWithDefaults;

    init() {
        self.f = OptWithDefaults{};
    }
}
