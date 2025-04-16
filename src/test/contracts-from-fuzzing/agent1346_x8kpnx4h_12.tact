struct DefaultValuesTest {
    a: Int = 7;
    b: Bool = true;
    c: String = "x";
}

contract StructDefaults {
    field: DefaultValuesTest;

    init() {
        self.field = DefaultValuesTest{};
    }
}