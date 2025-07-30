struct DefaultOpt {
    x: Int? = null;
    y: Bool? = null;
    z: String? = null;
}

contract TestContract {
    dopt: DefaultOpt;

    init() {
        self.dopt = DefaultOpt{};
    }
}