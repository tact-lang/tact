struct OptDefault {
    a: Int? = null;
    b: String? = null;
    c: Bool = true;
}

contract TestContract {
    field: OptDefault;

    init() {
        self.field = OptDefault{};
    }
}