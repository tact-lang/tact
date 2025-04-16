struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    c: String = "constant";
}

contract StructDefaults {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}