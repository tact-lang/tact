struct DefaultOption {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract ContractOptDefaults {
    f: DefaultOption;
    init() {
        self.f = DefaultOption{};
    }
}