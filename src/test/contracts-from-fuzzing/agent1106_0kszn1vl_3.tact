struct InnerLevel {
    val: Int?;
}

struct MiddleLevel {
    nestedInner: InnerLevel;
}

struct OuterLevel {
    mid: MiddleLevel;
}

contract DeeplyNestedStruct {
    storage: OuterLevel;

    init() {
        self.storage = OuterLevel{ mid: MiddleLevel{ nestedInner: InnerLevel{ val: null } } };
    }
}