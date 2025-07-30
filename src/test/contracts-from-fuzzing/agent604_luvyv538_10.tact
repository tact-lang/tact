struct NestedDeepOptional {
    x: Int?;
    y: String?;
}

struct DoubleLayerOptional {
    left: NestedDeepOptional?;
    right: NestedDeepOptional?;
}

contract TestDeepOptional {
    item: DoubleLayerOptional;

    init() {
        self.item = DoubleLayerOptional{
            left: null,
            right: null
        };
    }
}