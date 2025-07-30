struct SingleField {
    value: Int;
}

contract TestContract {
    field: SingleField;

    init() {
        self.field = SingleField{ value: 42 };
    }
}