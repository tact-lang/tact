struct Defaulted {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
}

contract StructWithDefaults {
    field: Defaulted;

    init() {
        self.field = Defaulted{};
    }
}