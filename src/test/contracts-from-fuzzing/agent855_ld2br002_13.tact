struct DefaultVals {
    a: Int = 5;
    b: Int?;
    c: Bool = true;
    d: String = "hi";
}

contract DefaultOptionals {
    s: DefaultVals;
    init() {
        self.s = DefaultVals{};
    }
}