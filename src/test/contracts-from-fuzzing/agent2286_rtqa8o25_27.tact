struct Base {
    id: Int;
}

contract OptionalStructField {
    baseField: Base? = null;

    init() {
        self.baseField = Base { id: 123 };
    }
}