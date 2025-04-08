struct NestedOptStruct {
    x: Int;
    y: Bool?;
    s: String?;
}

contract OptionalNestedField {
    data: NestedOptStruct?;

    init() {
        self.data = null;
    }
}