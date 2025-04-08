struct OptionalStruct {
    x: Int;
    y: Bool;
}

contract TopOptionalStruct {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}