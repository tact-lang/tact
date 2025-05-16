struct WithOptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    data: WithOptDefaults;

    init() {
        self.data = WithOptDefaults{};
    }
}