struct OptNested {
    x: Int;
    y: Int?;
}

contract OptNestedField {
    data: OptNested?;

    init() {
        self.data = null;
    }
}