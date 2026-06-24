struct DefaultOverride {
    x: Int = 42;
}

contract DefaultOverrideContract {
    d: DefaultOverride;

    init() {
        self.d = DefaultOverride{x: 100};
    }
}