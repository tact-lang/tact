struct DefaultVals {
    a: Int = 42;
    b: Bool = true;
    c: String = "abc";
}

contract Defaulted {
    s: DefaultVals;

    init() {
        self.s = DefaultVals{};
    }
}