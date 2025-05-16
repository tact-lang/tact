struct OptDefaults {
    a: Int? = 1;
    b: Int? = null;
    c: Int? = 42;
    d: String = "yo";
}

contract DefaultOpts {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{};
    }
}