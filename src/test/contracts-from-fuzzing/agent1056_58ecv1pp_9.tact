struct NullDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract NullDefaultOptionals {
    state: NullDefaults;

    init() {
        self.state = NullDefaults{
            a: null,
            b: null,
            c: null,
        };
    }
}