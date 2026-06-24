struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    num: Int;
    flag: Bool;
}

contract TestContract {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested{
            inner: InnerStruct{ num: 3, flag: true }
        };
    }
}