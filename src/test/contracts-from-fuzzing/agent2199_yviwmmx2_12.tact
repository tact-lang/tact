struct OptionalStruct {
    x: Int;
    y: Bool;
}

contract OptionalOfStruct {
    data: OptionalStruct?;
    init() {
        self.data = null;
    }
}
