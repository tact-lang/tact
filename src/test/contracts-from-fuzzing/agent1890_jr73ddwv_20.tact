struct DefaultOpt {
    x: Int? = null;
    y: String? = null;
}

contract ContractDefaultOpt {
    defaults: DefaultOpt;

    init() {
        self.defaults = DefaultOpt{};
    }
}