struct OptionalNested {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
}

struct OuterOptional {
    nested: OptionalNested?;
    note: String;
}

contract OptNestedContract {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            nested: null,
            note: "Testing",
        };
    }
}