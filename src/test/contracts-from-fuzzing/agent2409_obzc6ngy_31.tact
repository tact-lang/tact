struct HasStringDefaults {
    s1: String = "a";
    s2: String = "b";
}

contract StringDefaultsPersist {
    obj: HasStringDefaults;

    init() {
        self.obj = HasStringDefaults{};
    }
}