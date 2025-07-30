struct OneField {
    x: Int;
}

contract SingleStructField {
    field: OneField;

    init() {
        self.field = OneField{x:42};
    }
}
