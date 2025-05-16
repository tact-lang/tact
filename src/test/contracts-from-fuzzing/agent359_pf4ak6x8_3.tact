struct Inner {
    innerVal: Int;
    innerBool: Bool;
}

struct Outer {
    outerInt: Int;
    innerStruct: Inner;
    optInner: Inner?;
}

contract DeepNest {
    testField: Outer;

    init() {
        self.testField = Outer{
            outerInt: 7,
            innerStruct: Inner{innerVal: 1, innerBool: true},
            optInner: null
        };
    }
}