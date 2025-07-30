struct DefaultOpt {
    x: Int? = null;
    y: Bool? = null;
    s: String? = null;
}

contract TestContract {
    d: DefaultOpt;
    init() {
        self.d = DefaultOpt{};
    }
}
