struct InnerDefault {
    val: Int = 42;
    text: String = "hi";
}

struct MultiLayerDefaults {
    l1: InnerDefault = InnerDefault{};
}

contract NestedDefaults {
    field: MultiLayerDefaults;

    init() {
        self.field = MultiLayerDefaults{};
    }
}