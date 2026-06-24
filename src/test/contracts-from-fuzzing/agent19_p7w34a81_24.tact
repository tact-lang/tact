struct Defaulted {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
}

contract StructWithDefaults {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}