struct Inner {
    i: Int;
}

struct Layer {
    inner: Inner?;
}

struct Top {
    layer: Layer?;
}

contract TwoLayerOptionalsStruct {
    data: Top;

    init() {
        self.data = Top{layer: null};
    }
}