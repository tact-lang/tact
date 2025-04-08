struct NestedOptionals {
    val1: Int?;
    val2: Bool?;
}

struct OptionalStruct {
    inner: NestedOptionals?;
}

contract OptionalInsidePersist {
    field: OptionalStruct;
    init() {
        self.field = OptionalStruct{
            inner: null
        };
    }
}