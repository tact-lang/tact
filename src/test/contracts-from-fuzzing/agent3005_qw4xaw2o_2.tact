struct InnerMost {
    a: Int;
    b: Bool;
}

struct Inner {
    nested: InnerMost;
    flag: Bool;
}

struct Outer {
    innerStruct: Inner;
    num: Int;
}

contract DeepNestedStorage {
    complex: Outer;

    init() {
        self.complex = Outer{
            innerStruct: Inner{
                nested: InnerMost{
                    a: 10,
                    b: true,
                },
                flag: false,
            },
            num: 99,
        };
    }
}