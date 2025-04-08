struct OptStruct {
    x: Int?;
    y: Bool;
}

contract StructWithOptField {
    field: OptStruct;

    init() {
        self.field = OptStruct {
            x: null,
            y: false
        };
    }
}
