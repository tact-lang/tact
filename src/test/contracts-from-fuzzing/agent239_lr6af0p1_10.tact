struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    s: String = "hello";
}

contract DefaultValsContract {
    dat: DefaultVals;

    init() {
        self.dat = DefaultVals{};
    }
}