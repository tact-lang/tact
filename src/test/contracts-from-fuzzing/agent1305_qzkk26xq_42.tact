struct SerialOptDef {
    a: Int as uint8 = 3;
    b: Int? as uint8 = null;
}

contract SerialDefaults {
    x: SerialOptDef;

    init() {
        self.x = SerialOptDef{};
    }
}