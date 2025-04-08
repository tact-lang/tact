struct InnerMost {
    value: Int;
}

struct MiddleLevel {
    item: InnerMost;
}

struct OuterAll {
    contents: MiddleLevel;
}

contract ChainStruct {
    chain: OuterAll;

    init() {
        self.chain = OuterAll{ contents: MiddleLevel{ item: InnerMost{ value: 7 } } };
    }
}