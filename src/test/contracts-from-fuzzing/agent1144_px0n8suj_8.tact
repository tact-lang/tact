struct DefaultVals {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultValsContract {
    d: DefaultVals;

    init() {
        self.d = DefaultVals{};
    }
}