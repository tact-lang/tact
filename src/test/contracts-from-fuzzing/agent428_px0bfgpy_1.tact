struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
    flag: Bool;
}

contract DeepNestTest {
    state: DeeplyNested;

    init() {
        self.state = DeeplyNested{ inner: InnerStruct{ value: 7, flag: false }};
    }
}
