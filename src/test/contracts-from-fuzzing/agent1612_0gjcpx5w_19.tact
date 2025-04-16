struct Defaulted {
    a: Int = 1;
    b: String = "X";
    c: Bool = true;
}

contract StructDefaults {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}
