struct DeeplyNested {
    layer: InnerMost;
}

struct InnerMost {
    value: Int;
}

contract NestedOrder {
    item: DeeplyNested;

    init() {
        self.item = DeeplyNested{
            layer: InnerMost{ value: 77 }
        };
    }
}