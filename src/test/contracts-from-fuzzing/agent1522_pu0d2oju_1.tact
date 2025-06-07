struct DeepNested {
    val: Int;
    child: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    nested: LeafStruct;
}

struct LeafStruct {
    num: Int;
    optStr: String?;
}

contract NestedTest {
    foo: DeepNested;
    init() {
        self.foo = DeepNested{
            val: 42,
            child: InnerStruct{
                flag: true,
                nested: LeafStruct{
                    num: 7,
                    optStr: null,
                },
            },
        };
    }
}