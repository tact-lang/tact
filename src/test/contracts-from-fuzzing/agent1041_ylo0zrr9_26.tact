struct WithStringDefaults {
    s1: String = "a";
    s2: String? = null;
    s3: String = "b";
    s4: String? = null;
}

contract StringDefaultsTest {
    stuff: WithStringDefaults;

    init() {
        self.stuff = WithStringDefaults{};
    }
}
