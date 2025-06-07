struct DefaultOpt {
    foo: Int? = null;
    bar: Bool? = null;
}

contract DefaultsWithOpt {
    d: DefaultOpt;

    init() {
        self.d = DefaultOpt{};
    }
}