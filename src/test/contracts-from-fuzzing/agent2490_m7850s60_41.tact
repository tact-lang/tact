struct WithDefaultsOpt {
    a: Int? = null;
    b: Bool? = null;
}

contract DefaultsOptContract {
    data: WithDefaultsOpt;

    init() {
        self.data = WithDefaultsOpt{};
    }
}