struct DefaultVals {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultValsContract {
    s: DefaultVals;
    init() {
        self.s = DefaultVals{};
    }
}