struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    innerMost: Bool;
}

contract MultiLevelContract {
    data: DeepNested = DeepNested{ inner: InnerStruct { innerMost: false } };

    receive() {}
}