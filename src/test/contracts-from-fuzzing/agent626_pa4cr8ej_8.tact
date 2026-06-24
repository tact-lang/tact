struct HasDefaults {
    alpha: Int = 1;
    beta: Bool = false;
    gamma: String = "abc";
}

contract DefaultVals {
    d: HasDefaults;

    init() {
        self.d = HasDefaults{};
    }
}