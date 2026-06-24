struct DeepNested {
    inner: InnerStruct;
    flag: Bool;
}

struct InnerStruct {
    id: Int;
    optionalName: String?;
}

contract Test {
    dn: DeepNested = DeepNested{
        inner: InnerStruct{
            id: 42,
            optionalName: null,
        },
        flag: true,
    };

    init() {}
}