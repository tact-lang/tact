struct OptionalNestedStruct {
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract OptionalStructField {
    item: OptionalNestedStruct;
    init() {
        self.item = OptionalNestedStruct{nested: null};
    }
}