struct DefaultVals {
    x: Int = 10;
    y: Bool = true;
}

contract DefaultStructField {
    s: DefaultVals;
    init() {
        self.s = DefaultVals{};
    }
}