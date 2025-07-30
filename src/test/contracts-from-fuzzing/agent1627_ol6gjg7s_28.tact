struct DefaultValStruct {
    x: Int = 42;
    y: String = "hello";
    z: Bool = true;
}

contract DefaultsInStruct {
    s: DefaultValStruct;

    init() {
        self.s = DefaultValStruct{};
    }
}
