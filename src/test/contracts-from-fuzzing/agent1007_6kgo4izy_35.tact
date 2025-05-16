struct DefaultsStruct {
    x: Int = 0;
    y: Bool = false;
    z: String = "";
}

contract DefS {
    a: DefaultsStruct;

    init() {
        self.a = DefaultsStruct{};
    }
}