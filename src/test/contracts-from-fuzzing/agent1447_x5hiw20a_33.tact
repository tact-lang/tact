struct DefaultsAndOpts {
    s: String = "default";
    maybe: Cell?;
}

contract StructMixDefaultsOpts {
    data: DefaultsAndOpts;

    init() {
        self.data = DefaultsAndOpts{};
    }
}