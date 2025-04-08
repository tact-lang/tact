struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedStructField {
    nested: NestedStruct;
    init() {
        self.nested = NestedStruct{
            a: 42,
            b: true,
            c: "hello",
        };
    }
}