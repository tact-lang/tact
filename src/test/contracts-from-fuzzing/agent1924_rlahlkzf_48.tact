struct DefaultStringOpts {
    s1: String? = null;
    s2: String? = null;
}

contract TestContract {
    s: DefaultStringOpts;

    init() {
        self.s = DefaultStringOpts{};
    }
}