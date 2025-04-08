struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    opt: Bool?;
}

contract TestDeepNesting {
    data: DeepNested = DeepNested{inner: InnerStruct{a: 5, opt: true}};
}