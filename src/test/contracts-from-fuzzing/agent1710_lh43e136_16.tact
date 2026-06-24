struct OptDefault {
    a: Int? = null;
    b: Bool? = null;
}

contract DefaultOptStorage {
    data: OptDefault;

    init() {
        self.data = OptDefault{};
    }
}