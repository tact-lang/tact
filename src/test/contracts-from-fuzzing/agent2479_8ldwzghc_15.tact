struct OptionalBoolStruct {
    x: Bool?;
    y: Bool?;
    z: Bool?;
}

contract OptionalBools {
    flags: OptionalBoolStruct;
    init() {
        self.flags = OptionalBoolStruct{
            x: null,
            y: true,
            z: null,
        };
    }
}