struct DeepNested {
    inner: Inner;
    optInner: Inner?;
}

struct Inner {
    intField: Int;
    boolField: Bool;
    strField: String;
    optInt: Int?;
}

contract TestContract {
    deepField: DeepNested;

    init() {
        self.deepField = DeepNested{
            inner: Inner{
                intField: 1,
                boolField: true,
                strField: "hello",
                optInt: null
            },
            optInner: null
        };
    }
}