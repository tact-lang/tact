struct OptionalStruct {
    nested: Inner?;
}

struct Inner {
    x: Int;
}

contract OptionalStructContract {
    field: OptionalStruct;

    init() {
        self.field = OptionalStruct{nested: null};
    }
}