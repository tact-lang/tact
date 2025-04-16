struct DefaultsStruct {
    a: Int = 1;
    b: Bool = true;
    c: String = "default";
}

contract DefaultsTest {
    data: DefaultsStruct;
    
    init() {
        self.data = DefaultsStruct{};
    }
}