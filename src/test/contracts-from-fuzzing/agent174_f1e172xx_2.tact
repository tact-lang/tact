struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    value: Int;
}

contract TestContract {
    state: DeeplyNested;

    init() {
        self.state = DeeplyNested{ inner: InnerStruct{ flag: true, value: 5 } };
    }
}