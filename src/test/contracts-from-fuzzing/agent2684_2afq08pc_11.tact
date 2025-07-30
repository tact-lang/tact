struct InnerDefaults {
    num: Int = 13;
    flag: Bool = true;
}

contract DefaultsTest {
    testField: InnerDefaults;

    init() {
        self.testField = InnerDefaults{num: 44, flag: false};
    }
}
