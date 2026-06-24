struct DeepOptionalInner {
    val: Int?;
    flag: Bool?;
    note: String?;
}

struct Parent {
    child: DeepOptionalInner?;
}

contract OptionalNestedStruct {
    storage: Parent;

    init() {
        self.storage = Parent {
            child: null
        };
    }
}