struct NestedStruct {
    value: Int;
    flag: Bool;
}

contract NestedStructField {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            value: 10,
            flag: true
        };
    }
}