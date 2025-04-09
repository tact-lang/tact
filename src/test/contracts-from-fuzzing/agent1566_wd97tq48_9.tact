struct DeepNestedOpt {
    s1: Int?;
    s2: String?;
    s3: Cell?;
    s4: Bool?;
}

struct MidLevel {
    deep: DeepNestedOpt?;
    number: Int;
}

struct TopStruct {
    mid: MidLevel?;
}

contract OptChain {
    storage: TopStruct;

    init() {
        self.storage = TopStruct{ mid: null };
    }
}
