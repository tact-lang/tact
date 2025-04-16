struct DeepNested {
    level2: NestedOpt;
}

struct NestedOpt {
    inner: Int?;
}

contract TestDeepStruct {
    data: DeepNested;
    init() {
        self.data = DeepNested{level2: NestedOpt{inner: null}};
    }
}