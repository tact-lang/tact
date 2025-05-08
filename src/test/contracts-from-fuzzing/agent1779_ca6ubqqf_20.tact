struct DefaultValStruct {
    x: Int = 5;
    y: Bool = true;
    z: String = "hello";
}

contract DefaultsInStruct {
    data: DefaultValStruct;
    init() {
        self.data = DefaultValStruct{};
    }
}