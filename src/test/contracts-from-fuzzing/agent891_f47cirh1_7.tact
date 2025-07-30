struct WithDefaults {
    aval: Int = 5;
    bval: Bool = true;
    sval: String = "xyz";
}

contract DefaultsStructTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{}; // use all defaults
    }
}
