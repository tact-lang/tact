struct PrimDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "test";
}

contract PrimDefContract {
    field: PrimDefaults;

    init() {
        self.field = PrimDefaults{};
    }
}
