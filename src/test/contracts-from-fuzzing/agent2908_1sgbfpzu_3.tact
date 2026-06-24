struct NestedOpt {
    x: Int = 5;
    y: Bool = true;
}

contract OptionalStructField {
    field: NestedOpt?;
    init() {
        self.field = null;
    }
}