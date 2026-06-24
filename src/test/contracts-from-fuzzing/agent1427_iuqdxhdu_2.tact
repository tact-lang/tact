struct NestedStructLevel2 {
    fieldA: Int;
    fieldB: Bool;
}

struct NestedStructLevel1 {
    nested: NestedStructLevel2;
    fieldC: String;
}

contract NestedStructContract {
    nestedField: NestedStructLevel1;
    init() {
        self.nestedField = NestedStructLevel1{
            nested: NestedStructLevel2{
                fieldA: 10,
                fieldB: true,
            },
            fieldC: "hello",
        };
    }
}