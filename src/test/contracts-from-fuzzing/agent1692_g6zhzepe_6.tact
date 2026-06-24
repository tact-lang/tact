struct EmbeddedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStruct {
    optStruct: EmbeddedOptionals?;
    init() {
        self.optStruct = null;
    }
}