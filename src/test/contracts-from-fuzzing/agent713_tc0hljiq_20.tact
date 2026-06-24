struct DefaultOpt {
    x: Int? = null;
    y: Bool? = null;
}

contract DefaultOptionals {
    s: DefaultOpt;
    init() {
        self.s = DefaultOpt{};
    }
}