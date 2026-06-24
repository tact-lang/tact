struct DefaultVals {
    a: Int = 10;
    b: Bool = true;
    c: String = "x";
}

contract DefaultInit {
    d: DefaultVals;

    init() {
        self.d = DefaultVals{};
    }
}