struct OptDefault {
    f1: Int? = null;
    f2: Bool? = null;
}

contract StructWithOptDefaults {
    data: OptDefault;

    init() {
        self.data = OptDefault{};
    }
}