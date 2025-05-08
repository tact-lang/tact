struct InnerStruct {
    x: Int;
    y: Int;
}

contract NestedStructField {
    point: InnerStruct;

    init() {
        self.point = InnerStruct{ x: 5, y: 10 };
    }
}