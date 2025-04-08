struct DefaultVals {
    intv: Int = 42;
    boolv: Bool = false;
    strv: String = "a";
    optv: Int? = null;
}

contract StructWithDefaults {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}