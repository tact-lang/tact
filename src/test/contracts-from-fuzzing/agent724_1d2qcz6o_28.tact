struct DefaultsOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    d: DefaultsOpt;

    init() {
        self.d = DefaultsOpt{};
    }
}