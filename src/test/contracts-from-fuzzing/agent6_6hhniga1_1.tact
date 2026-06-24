struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract TestContract {
    state: DeeplyNested;

    init() {
        self.state = DeeplyNested{
            inner: InnerStruct{
                val: 42,
                flag: true,
            },
        };
    }
}
