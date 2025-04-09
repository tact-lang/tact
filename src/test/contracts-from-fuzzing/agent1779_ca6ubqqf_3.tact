struct InnerStruct {
    value: Int;
}

struct NestedStruct {
    inner: InnerStruct;
    flag: Bool;
}

contract NestedStructField {
    field: NestedStruct;
    init() {
        self.field = NestedStruct{inner: InnerStruct{value: 42}, flag: true};
    }
}