struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract TestContract {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested{
            inner: InnerStruct{
                val: 42,
                flag: false,
            }
        };
    }
}