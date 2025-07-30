struct DeepNested {
    b: Bool;
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
    opt: Int?;
}

contract DeepPersist {
    nestedState: DeepNested;

    init() {
        self.nestedState = DeepNested{
            b: false,
            inner: InnerStruct{ val: 7, opt: null }
        };
    }
}