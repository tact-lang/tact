struct TwoLayer {
    layer1: Int;
    layer2: Bool;
}

struct TopLayer {
    field1: Int;
    nested: TwoLayer;
}

contract StructInStructPersistent {
    stored: TopLayer;

    init() {
        self.stored = TopLayer{
            field1: 77,
            nested: TwoLayer{ layer1: 88, layer2: true },
        };
    }
}