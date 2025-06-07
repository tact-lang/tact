struct InnerStruct {
    x: Int;
    y: Int?;
}

contract DeepNestedFields {
    point: InnerStruct;
    optionalPoint: InnerStruct?;

    init() {
        self.point = InnerStruct{x: 1, y: 2};
        self.optionalPoint = InnerStruct{x: 3, y: null};
    }
}