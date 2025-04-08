struct DefaultsOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
}

contract DefaultOptionalValues {
    field: DefaultsOpt;
    init() {
        self.field = DefaultsOpt{};
    }
}