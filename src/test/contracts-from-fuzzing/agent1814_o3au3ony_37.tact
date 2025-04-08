struct DefaultsOpt {
    i: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract DefaultsOptional {
    d: DefaultsOpt;

    init() {
        self.d = DefaultsOpt{};
    }
}
