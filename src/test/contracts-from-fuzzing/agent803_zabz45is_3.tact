struct DefaultsNest {
    val: Int = 42;
    str: String = "hello";
    opt: Bool?;
}

contract DefaultsTest {
    testField: DefaultsNest;

    init() {
        self.testField = DefaultsNest{ };
    }
}