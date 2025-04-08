struct OptionalDefaults {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: Bool? = false;
}

contract TestContract {
    var: OptionalDefaults;

    init() {
        self.var = OptionalDefaults{
            a: null,
            c: null
        };
    }
}