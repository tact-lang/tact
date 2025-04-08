struct DefaultVals {
    foo: Int = 2;
    bar: Bool = true;
}

contract StructDefaults {
    s: DefaultVals;

    init() {
        self.s = DefaultVals{};
    }
}
