struct OptionalInStruct {
    x: Int?;
    y: Int;
}

contract OptOrder {
    field: OptionalInStruct;

    init() {
        self.field = OptionalInStruct{
            x: null,
            y: 42
        };
    }
}
