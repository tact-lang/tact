struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";
}

contract Test7 {
    st: DefaultVals;

    init() {
        self.st = DefaultVals{};
    }
}
