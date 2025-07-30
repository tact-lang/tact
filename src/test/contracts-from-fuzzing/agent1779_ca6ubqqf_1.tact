struct InnerStruct {
    value: Int;
}

contract SingleSimpleField {
    field: InnerStruct;
    init() {
        self.field = InnerStruct{value: 1};
    }
}