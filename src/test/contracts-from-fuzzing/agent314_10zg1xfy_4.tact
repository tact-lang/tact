struct OptionalNestedStruct {
    inner: Int?;
}

struct ComplexInner {
    s: OptionalNestedStruct;
    flag: Bool;
    number: Int;
    word: String;
}

contract OptionalStructField {
    field: ComplexInner?;
    init() {
        self.field = null;
    }
}