struct Inner {
    strField: String;
    intField: Int;
    optBool: Bool?;
}

struct Outer {
    innerStruct: Inner;
    outerInt: Int;
}

contract DeepNestedStructTest {
    data: Outer;

    init() {
        self.data = Outer{
            innerStruct: Inner{
                strField: "hello",
                intField: 42,
                optBool: null,
            },
            outerInt: 100,
        };
    }
}