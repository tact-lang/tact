struct DefaultsStruct {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
}

contract DefaultsTest {
    data: DefaultsStruct;
    init() {
        self.data = DefaultsStruct{};
    }
}