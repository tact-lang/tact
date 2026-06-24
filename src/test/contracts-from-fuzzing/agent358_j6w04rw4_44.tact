struct DefaultsOpt {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract DefaultsOptC {
    x: DefaultsOpt;
    init() {
        self.x = DefaultsOpt{};
    }
}