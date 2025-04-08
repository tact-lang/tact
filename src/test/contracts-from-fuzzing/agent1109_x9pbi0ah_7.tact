struct DefaultsStruct {
    a: Int = 1;
    b: Bool = false;
    s: String = "hello";
}

contract DefaultsTest {
    data: DefaultsStruct;

    init() {
        self.data = DefaultsStruct{};
    }
}