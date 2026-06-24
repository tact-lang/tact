struct DefaultOpt {
    n: Int? = null;
    b: Bool = true;
}

contract TestContract {
    f: DefaultOpt;
    init() {
        self.f = DefaultOpt{};
    }
}