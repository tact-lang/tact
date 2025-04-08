struct OptionalBoolStruct {
    b1: Bool?;
    b2: Bool?;
}

contract OptionalBools {
    flags: OptionalBoolStruct;

    init() {
        self.flags = OptionalBoolStruct{
            b1: null,
            b2: true
        };
    }
}
