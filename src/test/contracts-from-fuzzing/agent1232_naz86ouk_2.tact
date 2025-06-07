struct NestedStruct1 {
    foo: Bool;
    bar: Int;
}

contract NestedStructField {
    value: NestedStruct1;

    init() {
        self.value = NestedStruct1{foo: true, bar: 7};
    }
}
