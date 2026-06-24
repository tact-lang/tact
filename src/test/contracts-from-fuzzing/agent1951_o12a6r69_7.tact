struct DefaultVals {
    a: Int = 2;
    b: Bool = false;
    c: String = "x";
}

contract TestDefaults {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}