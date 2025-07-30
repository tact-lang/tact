struct DefaultsStruct {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int? = null;
}

contract DefaultsTest {
    s: DefaultsStruct;

    init() {
        self.s = DefaultsStruct{};
    }
}
