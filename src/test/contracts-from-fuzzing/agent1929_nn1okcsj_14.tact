struct DefaultVals {
    x: Int = 5;
    y: Bool = true;
    z: String = "abc";
}

contract DefaultStructVals {
    d: DefaultVals;
    init() {
        self.d = DefaultVals{};
    }
}