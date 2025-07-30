struct DefaultVals {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
}

contract StructWithDefaults {
    s: DefaultVals;

    init() {
        self.s = DefaultVals{};
    }
}