struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract OptionalDefaultsContract {
    data: OptionalDefaults;

    init() {
        self.data = OptionalDefaults{
            a: null,
            b: null,
            s: null
        };
    }
}