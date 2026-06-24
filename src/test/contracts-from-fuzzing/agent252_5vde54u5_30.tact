struct WithManyDefaults {
    a: Int = 1;
    b: Int? = null;
    c: Bool = false;
    d: Bool? = null;
    e: String = "foo";
    f: String? = null;
}

contract DefaultsHeavy {
    v: WithManyDefaults;

    init() {
        self.v = WithManyDefaults{};
    }
}