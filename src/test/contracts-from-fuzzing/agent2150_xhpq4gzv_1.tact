struct DeeplyNested {
    optInner: InnerStruct?;
}

struct InnerStruct {
    optDeep: DeeperStruct?;
}

struct DeeperStruct {
    value: Int?;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            optInner: InnerStruct{
                optDeep: DeeperStruct{
                    value: 123
                }
            }
        };
    }
}