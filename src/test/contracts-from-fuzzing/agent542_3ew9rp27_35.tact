struct NegativeIntDefaults {
    a: Int = -1;
    b: Int = -2;
    c: Int = -3;
}

contract TestContract {
    data: NegativeIntDefaults;

    init() {
        self.data = NegativeIntDefaults{};
    }
}