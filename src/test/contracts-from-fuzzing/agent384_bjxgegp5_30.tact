struct OptionalEmptyDefault {
    a: Int? = null;
}

contract TestOptionalDefault {
    s: OptionalEmptyDefault = OptionalEmptyDefault{a: null};

    init() {
        self.s.a = null;
    }
}