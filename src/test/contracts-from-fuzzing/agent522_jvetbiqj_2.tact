struct NestedStruct {
    x: Int;
    y: Bool;
}

contract StructField {
    point: NestedStruct;

    init() {
        self.point = NestedStruct{
            x: 10,
            y: false,
        };
    }
}