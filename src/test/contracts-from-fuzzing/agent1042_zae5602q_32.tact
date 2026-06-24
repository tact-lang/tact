struct MultiLayerOptional {
    a: Int?;
}

struct MultiLayerWrapper {
    inner: MultiLayerOptional?;
}

contract DeepOptional {
    field: MultiLayerWrapper;
    init() {
        self.field = MultiLayerWrapper{inner:null};
    }
}