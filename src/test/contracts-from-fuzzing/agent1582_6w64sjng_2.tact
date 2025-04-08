struct InnerStruct {
    a: Int;
    b: Int?;
}

contract NestedStructField {
    data: InnerStruct;
    init() {
        self.data = InnerStruct{a: 1, b: null};
    }
}