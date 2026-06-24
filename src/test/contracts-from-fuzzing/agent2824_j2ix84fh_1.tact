struct InnerStruct { a: Int; b: Bool; }

contract SingleNestedOptional {
    value: InnerStruct?;

    init() {
        self.value = null;
    }
}