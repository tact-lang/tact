struct VeryNested {
    depth1: Int;
    depth2: Int?;
    inner: InnerStruct;
}

struct InnerStruct {
    d1: Int;
    d2: Bool;
    nestedInner: DeeperStruct;
}

struct DeeperStruct {
    val: Int?;
}

contract TestContract {
    persistent: VeryNested;

    init() {
        self.persistent = VeryNested{
            depth1: 10,
            depth2: null,
            inner: InnerStruct{
                d1: 77,
                d2: true,
                nestedInner: DeeperStruct{
                    val: null
                }
            }
        };
    }
}