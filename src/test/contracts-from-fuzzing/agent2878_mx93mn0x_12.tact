struct DefaultsOpt {
    x: Int? = null;
    y: Bool? = true;
    z: String? = null;
}

contract TestContract {
    data: DefaultsOpt;

    init() {
        self.data = DefaultsOpt{};
    }
}