struct HasOptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool?;
}

contract OptionalInsideOptional {
    field: HasOptionalStruct;

    init() {
        self.field = HasOptionalStruct {
            inner: InnerStruct { x: 3, y: null }
        };
    }
}