struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    inner_deeper: DeeperStruct?;
}

struct DeeperStruct {
    flag: Bool;
    count: Int;
}

contract Test {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: InnerStruct{
                inner_deeper: DeeperStruct{
                    flag: true,
                    count: 42
                }
            }
        };
    }
}
