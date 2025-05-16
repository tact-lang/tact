struct NumericDefault {
    val: Int = -12345;
}

contract NegativeDefault {
    s: NumericDefault;

    init() {
        self.s = NumericDefault{};
    }
}