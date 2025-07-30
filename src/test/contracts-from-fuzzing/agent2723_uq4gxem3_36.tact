struct DefaultOpt {
    a: Int? = null;
}

contract OptDef {
    d: DefaultOpt;
    init() {
        self.d = DefaultOpt{};
    }
}