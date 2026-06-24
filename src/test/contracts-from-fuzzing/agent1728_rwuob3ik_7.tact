struct DeeplyNested {
    data: Int = 0;
}

struct MidLevel {
    inner: DeeplyNested;
}

struct TopLevel {
    middle: MidLevel;
}

contract TestContract {
    nested: TopLevel;

    init() {
        self.nested = TopLevel{ middle: MidLevel{ inner: DeeplyNested{} } };
    }
}