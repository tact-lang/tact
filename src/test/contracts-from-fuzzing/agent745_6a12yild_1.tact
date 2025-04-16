struct InnerStruct {
    val: Int;
}

contract SingleNestedOptional {
    field: InnerStruct?;

    init() {
        self.field = null;
    }
}