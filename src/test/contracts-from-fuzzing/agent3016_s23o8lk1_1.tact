struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    optInner: InnerMostStruct?;
}

struct InnerMostStruct {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerStruct{
                optInner: InnerMostStruct{
                    val1: 1,
                    val2: true,
                }
            }
        };
    }
}