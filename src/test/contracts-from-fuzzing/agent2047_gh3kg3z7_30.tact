struct OptionalBoolStruct {
    flag: Bool?;
}

contract OptionalStructDefault {
    s: OptionalBoolStruct? = null;

    init() {
        self.s = null;
    }
}