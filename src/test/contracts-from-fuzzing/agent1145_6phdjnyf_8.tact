struct DefaultsTestStruct {
    a: Int = 1;
    b: Bool = true;
    c: String = "default";
    d: Int?;  // should default to null
    e: Bool?; // should default to null
}

contract DefaultsTest {
    data: DefaultsTestStruct;

    init() {
        self.data = DefaultsTestStruct{};
    }
}
