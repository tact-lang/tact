struct InnerMost {
    flag: Bool;
    count: Int;
}

struct Inner {
    someVal: Int;
    deep: InnerMost;
    optionalInt: Int?;
}

struct Outer {
    innerStruct: Inner;
    message: String;
}

contract DeepNestedStorage {
    info: Outer;

    init() {
        self.info = Outer{
            innerStruct: Inner{
                someVal: 42,
                deep: InnerMost{
                    flag: false,
                    count: 999,
                },
                optionalInt: null,
            },
            message: "hi"
        };
    }
}