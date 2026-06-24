struct OptDefault {
    x: Int? = null;
    y: String? = null;
}

contract TestContract {
    s: OptDefault;

    init() {
        self.s = OptDefault{};
    }
}