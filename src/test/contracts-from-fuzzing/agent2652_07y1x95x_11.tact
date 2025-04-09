struct Defaulted {
    x: Int = 42;
    y: Bool = true;
}

contract StructWithDefaults {
    data: Defaulted;

    init() {
        self.data = Defaulted{}; // omit both fields -> should get defaults
    }
}