struct OptionalStruct {
    x: Inner?;
}

struct Inner {
    y: Int;
}

contract OptionalStructField {
    field: OptionalStruct;
    init() {
        self.field = OptionalStruct{ x: null };
    }
}