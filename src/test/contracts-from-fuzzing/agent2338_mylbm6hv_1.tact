struct NestedStruct {
    inner: InnerStructOption?; // Nested optional struct
}

struct InnerStructOption {
    val: Int?; // Optional inside nested struct
}

contract NestedOptionalsTest {
    storage: NestedStruct;

    init() {
        self.storage = NestedStruct{ inner: null };
    }
}