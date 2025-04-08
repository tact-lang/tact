struct DefaultOpt {
    x: Int? = null;
    y: Bool? = null;
}

contract StructOptDefaults {
    data: DefaultOpt;

    init() {
        self.data = DefaultOpt{};
    }
}
