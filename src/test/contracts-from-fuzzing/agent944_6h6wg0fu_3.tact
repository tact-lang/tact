struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    foo: FooStruct;
}

struct FooStruct {
    a: Int;
    b: Bool;
    txt: String;
    z: Int?;
}

contract Test {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: InnerStruct{
                foo: FooStruct{
                    a: 1, b: true, txt: "x", z: null
                }
            }
        };
    }
}