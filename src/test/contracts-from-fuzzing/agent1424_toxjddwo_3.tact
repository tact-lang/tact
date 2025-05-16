struct InnerMost {
    x: Int?;
    y: Bool;
}

struct Middle {
    fieldA: InnerMost;
    fieldB: String;
}

struct Outer {
    nestedStruct: Middle;
    count: Int;
    flag: Bool;
}

contract DeeplyNestedContract {
    nestedField: Outer;

    init() {
        self.nestedField = Outer{
            nestedStruct: Middle{
                fieldA: InnerMost{x: null, y: true},
                fieldB: "test"
            },
            count: 123,
            flag: false
        };
    }
}