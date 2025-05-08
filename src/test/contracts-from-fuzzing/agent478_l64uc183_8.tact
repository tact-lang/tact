struct DefaultVals {
    a: Int = 1;
    b: Bool = false;
    c: Int = 42;
    d: Bool = true;
}

contract Defaults {
    s: DefaultVals;
    init() {
        self.s = DefaultVals{};
    }
}