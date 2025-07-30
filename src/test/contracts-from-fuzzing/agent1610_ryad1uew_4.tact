struct DefaultsStruct {
    a: Int = 5;
    b: Bool = true;
    c: String = "test";
}

contract DefaultValuesTest {
    s: DefaultsStruct;

    init() {
        self.s = DefaultsStruct{};
    }
}