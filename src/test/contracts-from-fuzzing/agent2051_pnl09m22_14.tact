struct Defaulted {
    x: Int = 5;
    y: Bool = false;
}

contract StructWithDefaults {
    val: Defaulted;

    init() {
        self.val = Defaulted{};
    }
}