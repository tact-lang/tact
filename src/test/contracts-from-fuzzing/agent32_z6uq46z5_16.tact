struct MultiLayerOption {
    layer: InnerLayer?;
}

struct InnerLayer {
    val: LeafLayer?;
}

struct LeafLayer {
    x: Int?;
}

contract MultiLayerOptionTest {
    t: MultiLayerOption;

    init() {
        self.t = MultiLayerOption{
            layer: InnerLayer{
                val: LeafLayer{
                    x: null,
                },
            },
        };
    }
}
