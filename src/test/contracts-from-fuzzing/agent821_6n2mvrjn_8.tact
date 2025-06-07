struct DefaultVals {
    a: Int = 5;
    b: Bool = true;
    c: String = "default";
    d: Bool? = null;
    e: String? = null;
}

contract TestDefaults {
    field: DefaultVals;

    init() {
        self.field = DefaultVals{};
    }
}