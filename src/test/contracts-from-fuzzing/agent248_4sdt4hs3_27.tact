struct DefaultOpt {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract TestContract {
    x: DefaultOpt;

    init() {
        self.x = DefaultOpt{};
    }
}