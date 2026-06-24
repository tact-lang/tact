struct OneField {
    a: Int;
}

contract SimpleNested {
    field: OneField;

    init() {
        self.field = OneField{ a: 123 };
    }
}
