struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedStructField {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{a: 1, b: true, c: "test"};
    }
}