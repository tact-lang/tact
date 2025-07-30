struct WithManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract ManyDefaultsPersistent {
    f: WithManyDefaults;

    init() {
        self.f = WithManyDefaults{};
    }
}