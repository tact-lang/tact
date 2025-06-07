struct NestedOpt {
    x: Int?;
    y: Bool;
}

contract StructWithOptField {
    field: NestedOpt?;

    init() {
        self.field = null;
    }
}