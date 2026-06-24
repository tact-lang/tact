struct DefVals {
    a: Int = 5;
    b: Bool = true;
    c: String = "s";
}

contract DefaultVals {
    stored: DefVals;
    init() {
        self.stored = DefVals{};
    }
}