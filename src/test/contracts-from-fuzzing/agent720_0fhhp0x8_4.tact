struct DefaultsTest {
    withDefault: Int = 123;
    noDefault: Bool;
}

contract StructDefaults {
    s: DefaultsTest;

    init() {
        self.s = DefaultsTest{
            noDefault: true,
        };
    }
}