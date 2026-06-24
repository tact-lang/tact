struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "ok";
}

contract DefaultValues {
    rec: WithDefaults;

    init() {
        self.rec = WithDefaults{};
    }
}