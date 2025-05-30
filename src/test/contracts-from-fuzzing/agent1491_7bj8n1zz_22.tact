struct Defaults {
    a: String? = null;
    b: Bool? = true;
}

contract TestContract {
    data: Defaults;
    init() {
        self.data = Defaults{};
    }
}