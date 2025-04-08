struct InnerMost {
    deepestField: Int;
}

struct Inner {
    nestedOptional: InnerMost?;
    someBool: Bool;
}

struct Outer {
    innerStruct: Inner;
    anotherInt: Int;
}

contract DeepNestedOptionalTest {
    testField: Outer;

    init() {
        self.testField = Outer{
            innerStruct: Inner{
                nestedOptional: InnerMost{
                    deepestField: 42
                },
                someBool: true
            },
            anotherInt: 100
        };
    }
}