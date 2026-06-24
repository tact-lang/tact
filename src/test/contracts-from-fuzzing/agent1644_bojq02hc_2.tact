struct NestedStruct {
    x: Int;
    y: Int;
    label: String;
}

contract NestedStructField {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            x: 1,
            y: 2,
            label: "label"
        };
    }
}