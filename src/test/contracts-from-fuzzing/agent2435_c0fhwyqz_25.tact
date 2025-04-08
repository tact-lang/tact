contract NestedOptionalStruct {
    field: OptionalStruct?;

    init() {
        self.field = OptionalStruct{
            x: 1,
            y: "hi"
        };
    }
}

struct OptionalStruct {
    x: Int;
    y: String;
}