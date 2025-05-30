struct DefaultsTestStruct {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract DefaultsTest {
    data: DefaultsTestStruct;

    init() {
        self.data = DefaultsTestStruct{};
    }
}