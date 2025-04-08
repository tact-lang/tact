struct DeepNested {
    val: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    optionalNum: Int?;
}

contract NestedTest {
    data: DeepNested;

    init() {
        self.data = DeepNested {
            val: 10,
            inner: InnerStruct {
                flag: true,
                optionalNum: null,
            },
        };
    }
}