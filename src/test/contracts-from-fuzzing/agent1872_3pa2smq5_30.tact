struct WithManyDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "hey";
    o: Int? = null;
    p: String? = null;
    q: Bool? = null;
}

contract UseManyDefaults {
    nested: WithManyDefaults;
    init() {
        self.nested = WithManyDefaults{};
    }
}