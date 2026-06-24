struct DefaultVals {
    foo: Int = 99;
    bar: Bool = true;
    baz: String = "hello";
}

contract DefaultsTest {
    defVals: DefaultVals;

    init() {
        self.defVals = DefaultVals{};
    }
}