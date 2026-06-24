struct NestedStruct {
    a: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    b: Int;
    deeper: DeeperStruct;
}

struct DeeperStruct {
    c: Int;
}

contract NestFields {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{
            a: 1,
            inner: InnerStruct{
                b: 2,
                deeper: DeeperStruct{
                    c: 3
                }
            }
        };
    }
}