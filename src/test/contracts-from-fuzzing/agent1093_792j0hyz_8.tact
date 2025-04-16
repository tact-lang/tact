struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

contract StructWithDefaults {
    d: DefaultVals;

    init() {
        self.d = DefaultVals{};
    }
}