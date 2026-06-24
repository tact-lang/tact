struct OptionalStruct {
    x: Int;
    y: Bool?
}

contract OptionalAsField {
    os: OptionalStruct?;
    init() {
        self.os = OptionalStruct{
            x: 1,
            y: null
        };
    }
}