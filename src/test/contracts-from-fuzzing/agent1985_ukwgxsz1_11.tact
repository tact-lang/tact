struct DefaultVals {
    a: Int = 42;
    b: String = "hello";
    c: Bool = false;
}

contract WithDefaults {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}
