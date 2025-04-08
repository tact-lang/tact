struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    subfield: SubStruct;
}

struct SubStruct {
    val: Int;
    flag: Bool;
}

contract TestNested {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerStruct{
                subfield: SubStruct{
                    val: 123,
                    flag: true,
                }
            }
        };
    }
}
