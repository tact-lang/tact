struct DefaultNestedOpt {
    a: Int? = null;
    b: Bool? = false;
}

contract ChainDefaultsWithOptionals {
    x: DefaultNestedOpt = DefaultNestedOpt{};

    init() {
        self.x = DefaultNestedOpt{};
    }
}