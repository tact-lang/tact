struct DefaultOpt {
    foo: Int? = null;
}

contract DefaultOptionalVal {
    v: DefaultOpt;

    init() {
        self.v = DefaultOpt{};
    }
}