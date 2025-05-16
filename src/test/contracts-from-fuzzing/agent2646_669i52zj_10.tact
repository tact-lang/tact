struct DefaultsStruct {
    a: Int = 42;
    b: Bool = false;
    c: String = "default";
}

contract DefaultsTest {
    s: DefaultsStruct;
    init() {
        self.s = DefaultsStruct{};
    }
    receive() {}
}