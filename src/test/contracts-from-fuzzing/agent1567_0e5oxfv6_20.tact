struct DefaultedOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
}

contract OptDefaults {
    opts: DefaultedOptionals;

    init() {
        self.opts = DefaultedOptionals{};
    }
}