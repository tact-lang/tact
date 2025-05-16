struct DefaultO {
    x: Int? = null;
    y: Bool? = null;
}

contract DefaultsOpt {
    d: DefaultO;
    init() {
        self.d = DefaultO{};
    }
}