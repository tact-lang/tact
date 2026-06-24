struct DefaultValStruct {
    x: Int = 5;
    y: Bool = true;
    z: String = "default";
}

contract UseDefaults {
    s: DefaultValStruct;

    init() {
        self.s = DefaultValStruct{};
    }
}
