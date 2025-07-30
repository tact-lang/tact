struct OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Int? = null;
    d: Bool? = null;
    e: Int? = null;
    f: Bool? = null;
}

contract ManyDefaults {
    field: OptDefaults;

    init() {
        self.field = OptDefaults{
            a: null, b: null, c: null, d: null, e: null, f: null
        };
    }
}