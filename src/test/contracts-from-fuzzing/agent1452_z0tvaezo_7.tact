struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";
}

contract StructWithDefaults {
    v: DefaultVals;

    init() {
        self.v = DefaultVals{};
    }
}