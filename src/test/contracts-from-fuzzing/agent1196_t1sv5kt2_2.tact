struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract NestedStructField {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            a: 1,
            b: true,
            c: "Hello",
        };
    }
}