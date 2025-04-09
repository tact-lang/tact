struct OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Cell? = null;
}

contract OptDefaultsContract {
    store: OptDefaults = OptDefaults{};
}