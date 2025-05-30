struct OptionalStruct {
    x: Int;
    y: Bool?;
}

contract StructFieldOptional {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}