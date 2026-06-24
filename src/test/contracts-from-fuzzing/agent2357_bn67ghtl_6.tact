struct InnerNested {
    x: Int;
}

struct MiddleNested {
    nestedField: InnerNested;
}

contract OptionalNestedField {
    myField: MiddleNested?;

    init() {
        self.myField = null;
    }
}
