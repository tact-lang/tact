struct InitialVals {
    foo: Int = 5;
    bar: Bool = true;
}

contract InitDefaults {
    st: InitialVals;

    init() {
        self.st = InitialVals{};
    }
}
