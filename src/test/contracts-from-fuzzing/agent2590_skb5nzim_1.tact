struct DeeplyNested {
    inner: MaybeInner;
}

struct MaybeInner {
    nested: InnerStruct?;
}

struct InnerStruct {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner: MaybeInner{ nested: null }
        };
    }
}