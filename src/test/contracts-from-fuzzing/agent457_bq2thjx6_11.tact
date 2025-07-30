struct DefaultsStruct {
    a: Int = 5;
    b: Bool = false;
    c: String = "hello";
}

contract Test {
    data: DefaultsStruct;
    init() {
        self.data = DefaultsStruct{};
    }
}